Delayed::Worker.max_attempts = 3
Delayed::Worker.delay_jobs = !Rails.env.test?