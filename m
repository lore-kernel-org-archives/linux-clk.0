Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D8173
	for <linux-clk@vger.kernel.org>; Wed,  6 Mar 2024 03:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709695211; cv=none; b=pUNqFfIa0NCQe/BCgr6kCmL7HkEI16EPtObGhmNp3u5qfUlY+rAuBeMvkKkHu38GUn659yu3a3imLewFLFW0kbQ+Hl+xF3efLpbbu0tat/S9SE1nPfUJFdzdAZDRom5T378pQYGYoe0qThuFuGzqASXuTIbl9ctXxetN+U7Yhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709695211; c=relaxed/simple;
	bh=dhjl/66VWnVN0bdWsBsnU2UZhUlkVYAIVb3mMRkadbU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=D1T46EPZFbA0wl/eqbkbkgSMAT7M+k2YYzwT7KxRgGwjb3zuDSrYZl3OD+Hn6+AuTZFwFBsWrfI3IPCnQOgqicF9ZLpNZL4jOJqeQdPWEl5Wl0pM2vHWpUxFQNf3pdZbkCMspV5yFBbQxwg8NDAH6BF8YlHsyMc8X+SjrWDNh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfFEzv0e; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfFEzv0e"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51320ca689aso7743988e87.2
        for <linux-clk@vger.kernel.org>; Tue, 05 Mar 2024 19:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709695208; x=1710300008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZFeGCf76AtADk4ySWTFDtvJLdQB6MyBdHLu8Wy+eQQ=;
        b=GfFEzv0eORd3z/RLUyefzlo6EERmXBBgaFzCOrtrpK9k47I1Krw5C4rjUzD+kmyJzN
         y3yT/o2Ur24M9dTrTWXLnybByajats0Oo2QAyTDYrNIEZ/nTGmdUxnDLGIUZGbc6j025
         zPSXMi0T/0gcJwcoO4TrnSP6hptTTcs2oxArnQyj76EOL3TErQxxYJSZH1Xge2yutXGq
         CRaF8HgQU5y+1BldjGxIJWZoj426eTwpSKvkqrRUhDnko3Y6RO3fQoJT1ZfRHTQHc/gm
         FoNx+Ox52fj2F1aeHaaeuDmLeCUMM47QywYRlI5OAyrkJs37eR5K16EIeJqXWART7cMM
         OxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709695208; x=1710300008;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kZFeGCf76AtADk4ySWTFDtvJLdQB6MyBdHLu8Wy+eQQ=;
        b=M2mf5io7nww+MyhHvztGpErZHmnMKrLYApPuACisCaSbMJbCMnrifT2iDNmycHeQoL
         0/BP8iUsOpGBfO3pc43SgHqNj2sG2w9sv4BKXU+HxrvrIGRFgbzY3G9uEaLqwYZJ7/xM
         qB2ZtaDowL/p51VdwVTJS3Q0l08GZt7Gn67lQ4k3TdKhPBB5ZiJDTl9KmUVz7/LcjgH5
         PJxERpSajQo2iikzWZfwO2I5rzoxEQ3FQFyHqmz5Pe1HR5sZfuXu4Y9ySd2TkcDcYuUw
         TRUT4hVXZhEL9TL3jYQ92VQ8/WW6HzvsClrgUjSi1pZxn4A0mzT0OGUPJpZwTstTgrjc
         j4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXUM1QY0750uynQFF3pHgEWm5cCj8z4GK/RgszjO5VGf6RZD1fZrtkoUF2LFwzSsqeKOJ+ibERwgjo9GM8oLdwKh5hgg0zasr9f
X-Gm-Message-State: AOJu0YxEG6vLNez4wkCkkOm0bu+EPQJfOzW3yqPAE5GMExdEK/T7XR0b
	YZlwPLN8k6eQlpKuetCEVE4J9vhBkSkcUZRu90Yf7MX1hNYzhXv+SV3titYs/+g=
X-Google-Smtp-Source: AGHT+IHDDsh54BVcBvmY8u6pxaxi7KZrpUylfY8JfSlSreD9KQfgxrfCv3UhHNgS9303mSML/Yi6+g==
X-Received: by 2002:a05:6512:31d2:b0:513:32e2:141b with SMTP id j18-20020a05651231d200b0051332e2141bmr2773526lfe.67.1709695207886;
        Tue, 05 Mar 2024 19:20:07 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id lf7-20020a170907174700b00a44d66a16efsm4557052ejc.2.2024.03.05.19.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 19:20:07 -0800 (PST)
Message-ID: <d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org>
Date: Wed, 6 Mar 2024 03:20:05 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: samsung: clk: re-parent MUX to OSCCLK at run-time
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 William McVicker <willmcvicker@google.com>, kernel-team@android.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Trying to get some feedback from the samsung experts. Please consider
the following:

                         ---------------------------------------------
                        |                                CMU_PERIC0   |
                        |                                             |
                        |  MUX_USI                                    |
                        |                                             |
                        |  |\                                         |
              OSCCLK ---|->| \                                        |
                        |  |  \                                       |
                        |  | M |                                      |
                        |  | U |--> DIV_CLK_PERIC0_USI*_ --> GATE_USI |
                        |  | X |        (1 ~ 16)                      |
                        |  |  /                                       |
DIV_CLKCMU_PERIC0_IP ---|->| /                                        |
    (1 ~ 16)          | |  |/                                         |
                      | |                                             |
                      | |                                             |
                      | |  MUX_I3C                                    |
                      | |                                             |
                      | |  |\                                         |
                      --|->| \                                        |
                        |  |  \                                       |
                        |  | M |                                      |
                        |  | U |--> DIV_CLK_PERIC0_I3C --> GATE_I3C   |
                        |  | X |                                      |
                        |  |  /                                       |
              OSCCLK ---|->| /                                        |
                        |  |/                                         |
                        |                                             |
                         ---------------------------------------------

Is it fine to re-parent the MUX_USI from above to OSCCLK at run-time,
during normal operation mode? Experimentally I determined that it's
fine, but the datasheet that I'm reading mentions OSCCLK just in the
low-power mode context:
i/ CMU ... "Communicates with Power Management Unit (PMU) to stop clocks
or switch OSC clock before entering a Low-Power mode to reduce power
consumption by minimizing clock toggling".
ii/ "All CMUs have MUXs to change the OSCCLK during power-down mode".

Re-parenting the MUX to OSCCLK allows lower clock rates for the USI
blocks than the DIV_CLK_PERIC0_USI can offer. For a USI clock rate below
6.25 MHz I have to either reparent MUX_USI to OSCCLK, or to propagate
the clock rate to the common divider DIV_CLKCMU_PERIC0_IP. I find the
propagation to the common DIV less desirable as a low USI clock rate
affects I3C by lowering its clock rate too. Worse, if the common bus
divider is not protected (using CLK_SET_RATE_GATE), USI can lower the
I3C clock rate without I3C noticing.

Either re-parenting the MUX_USI to OSCCLK, or propagating the clock rate
to DIV_CLKCMU_PERIC0_IP allows the same clock ranges. The first with the
benefit of not affecting the clock rate of I3C for USI clock rates below
6.25 MHz. Is it fine to re-parent MUX_USI to OSCCLK at run-time?

If no feedback is received I lean towards propagating the USI clock rate
to the common divider, but by protecting it with CLK_SET_RATE_GATE.

Feel free to add in To: or Cc: whoever might be interested. Thanks,
ta
