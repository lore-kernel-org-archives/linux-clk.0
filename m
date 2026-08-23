Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DEE380FD1
	for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787499647; cv=none; b=kcyIIRhHfo11Lhnv3zdCSMCfnC5HXheKQHZcqRfsddtEckZhPhpnRbP6Z2DRydmwIG2XE1r6I764RsugX/5teSINsAgbgzrL2wgielSkUMiqMeKh45imX6l8W7J6hxygp1Ncf1s3kSOqisak18E4OlSrw1xMNPDReeINpIEhfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787499647; c=relaxed/simple;
	bh=nP6om09oC2Yb+vrhtvu1ZSljcK3njbcGqTcyG2xxmP4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qcV0qVJ5B+8AtAVTESd9A+jfartGuF8QttsGnD2XzFaBhedyF644oKLkXw7HzbSwamS/XGDWrHh8AgaNbKA5IGZPIdSJlpWt+6Yix1Vk3kIzxgiPjbIxfzQMguAZZTbQrbTXZRY8qddNTJVLWQItAyKAWePGQ6b3GgFAsTPUdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f904e80eeso762374f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 08:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787499644; x=1788104444;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGssleoR8j5d5BjeV9KwAwh1Wr2o/KlpY4sV/yr+LHU=;
        b=lPa/T8lmIohlEFCh7yYS2BcOpoWIfpOmsRBnQJj0YC551+zq1DtxUzl/Vd5M1fm/WP
         ka5h48l3uSPZ5gKD3pEZP4xVZkx+f7jBwR/4iw40RRr1CuCkwCdG9in2qBsZc2ketUta
         cYJvGNmmisox12djwSwefQ0m3GTFNq5Zq1wjPL+e4Av0UT9QOjYqwJCP+bzj0i2uqsiW
         W30PbO9BXZWnP/Bj4jtpfBr8j7CoJPA/QdkPAUQqz+xfJT8qFuKUWyWi0s3AuIthABk2
         RNGgARWkm9Ig5pbcQwav4awMpZdAyvnD10Ul13SWeO9rrN7S36h84IpFRhOB72gPN7Ur
         YlJg==
X-Forwarded-Encrypted: i=1; AHgh+RrZwGWbFx69jvkFSb+w+yww+Pyr43BQLexH9OvQLAOUZk0OM2xvv01mZWIQZGc6+wAR/JkifwEdnms=@vger.kernel.org
X-Gm-Message-State: AFuF++mtKQpoDFQbNWOjn5HrIwvH/eHL25GtBNgsZq+SsDpauQhxCvYK
	Mve18mSsmr85VEhdOjOimZ3KGCmxDMHpLPzgvFsbZUxfTTRJD0E63RRW
X-Gm-Gg: AR+sD13ZmQ1tbF1DWXM39pWRQdVglOL+0y7cJ7nUX1izH3h2zKhXa9P/2acVAurDqNw
	emIBYi8rxxZmI6S5hBi9ifTIA6c/pZcTe3db2cmghItNEWcN2XWsWKyFNmJz5TAnT09FcSeMj74
	hMwac2L0Sr6aKSf3PoPChwiQTPR8P9e6m3Dk3hlgMjWfHF8NXMHAN7HVWL14KosHgPjrLyPswKz
	OBnti5iDo7iyOI2AWPSFKBuqMsfWklfSPzdilmjxtRf9xGZZq0kdykL7XkhxCcnJYuhod+k8nLl
	GQwmUk1ZzkeMmLXA3inpPl1lQ2wLDvoKf38NZ3+AFu/ObDxeKVH5GkNlpsnoExVaZJIaLU9Eo2Q
	PR2EubQ9Ajxjgaj5zQoxFuQqzU3RTM+7oZGxZoDwazLyk70yQOz93ctWfi3IaFDQjxNXbJ00Lir
	CwhHGOZxGr4Pr/+sDkz29Yiufx5mAv3GBcArW6SSU0luJP/ZhRzvdZ4OalUgOHWBnPWGGY9kyms
	Bv5tzD4ofjEify5dvU2yA==
X-Received: by 2002:a05:6000:2dc9:b0:482:9a18:d753 with SMTP id ffacd0b85a97d-482c0b44acbmr22762075f8f.5.1787499643925;
        Sun, 23 Aug 2026 08:40:43 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0acaesm5321239f8f.29.2026.08.23.08.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 08:40:42 -0700 (PDT)
Message-ID: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
Date: Sun, 23 Aug 2026 16:40:42 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Lucas Tanure <tanure@linux.com>
Subject: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I 
am hitting intermittent system instability, storage loss, and memory 
corruption during boot, unless I append clk_ignore_unused to the kernel 
command line.

Because the failure is intermittent, I am running 100-reboot test 
campaigns to bisect the remaining clocks and isolate which clocks are 
critical and cannot be safely disabled.

As testing takes significant time over serial console, I wanted to check 
if Amlogic or the maintainers could shed light on this:

Are there specific T7 clocks or hardware domains that must remain 
critical/protected even without an explicit in-kernel consumer?

Current clocks being disabled that don't kill the board on a test run:

[    0.380313] clk: Disabling unused clocks
[    0.380413] clk: Disabled unused clock: rtc_dualdiv
[    0.380718] clk: Disabled unused clock: rtc_duandiv_in
[    0.381377] clk: Unprepared unused clock: a73_div16
[    0.381972] clk: Unprepared unused clock: cpu_div16
[    0.382605] clk: Unprepared unused clock: f50m
[    0.383174] clk: Unprepared unused clock: fixed_pll_dco
[    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
[    0.384416] clk: Unprepared unused clock: sys1_pll_osc
[    0.385056] clk: Unprepared unused clock: earc_osc
[    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
[    0.386323] clk: Unprepared unused clock: eth_pll_osc
[    0.386961] clk: Unprepared unused clock: pcie_osc
[    0.387548] clk: Unprepared unused clock: mclk_pll_osc
[    0.388187] clk: Unprepared unused clock: usb_pll1_osc
[    0.388826] clk: Unprepared unused clock: usb_pll0_osc
[    0.389465] clk: Unprepared unused clock: tcon_pll_osc
[    0.390105] clk: Unprepared unused clock: top_pll_osc
[    0.390738] clk: Unprepared unused clock: aud_pll_osc
[    0.391361] clk: Unprepared unused clock: ddr_pll_osc

I am not forcing any clock to be disabled; I am forcing all clocks to 
stay on and letting them be disabled if unused one by one.

Any guidance or hints on required platform clocks would be greatly 
appreciated.

Thanks,
Lucas Tanure
