module Smooth
  RED_PIN=17
  GREEN_PIN=18
  BLUE_PIN=22

  def transition from: "00FF00", to: "FF0000"
    first_color = from.scan(/../).map{|c| c.to_i(16) }
    second_color = to.scan(/../).map{|c| c.to_i(16) }

    current_color = []

    (0..1).step(0.035).each do |step|
      current_color[0] = first_color[0] * (1 - step) + second_color[0] * step
      current_color[1] = first_color[1] * (1 - step) + second_color[1] * step
      current_color[2] = first_color[2] * (1 - step) + second_color[2] * step

      write_color_to pin: RED_PIN, color: current_color[0]
      write_color_to pin: GREEN_PIN, color: current_color[1]
      write_color_to pin: BLUE_PIN, color: current_color[2]
      sleep 0.01
    end
  end

  def transition_with_oscillation from: "00FF00", to: "FF0000"
    first_color = from.scan(/../).map{|c| c.to_i(16) }
    second_color = to.scan(/../).map{|c| c.to_i(16) }

    current_color = []

    while true
      (0..1).step(0.035).each do |step|
        current_color[0] = first_color[0] * (1 - step) + second_color[0] * step
        current_color[1] = first_color[1] * (1 - step) + second_color[1] * step
        current_color[2] = first_color[2] * (1 - step) + second_color[2] * step

        write_color_to pin: RED_PIN, color: current_color[0]
        write_color_to pin: GREEN_PIN, color: current_color[1]
        write_color_to pin: BLUE_PIN, color: current_color[2]
        sleep 0.01
      end

      sleep 0.1
      t = []
      t = second_color 
      second_color = first_color
      first_color = t
    end
  end

  private

  def write_color_to pin: RED_PIN, color: "FF0000"
    `echo "#{pin}=#{color/255.0}" > /dev/pi-blaster`
  end
end


