Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F883624C4
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772105153; cv=none; b=ic82JT9JlQbO5/xKGOfJgNGraGQpLwX7p0fJMoFnvbh0L1Sv5badRFVvZNNveYVjECKIOacsrysnsgOeYVVtpQ18ac5qxEYe0gdkQOGjo2qoySM2E/L+2YKJj8ohB4swQLR1yxRO+evFbfLmbVF8ilqm0g6JGxFhTn87d4HSeBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772105153; c=relaxed/simple;
	bh=X7aGML1SMAsWeqcVjsSBRTgitUAtQY7ToN2QOukGVTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHJAop1Qcfd9hQFtmSZd+tv/9QzR3Ibv4GjDIqSAlSHtOxv5ao0wEHjTVt6uyDMP3cu+q/x8hErGIoyzW2Wlbb2nds2MJWEZHKkJp1pCwKCylri2sJunrZCiazpkVwfWy2UAP0dD+7dziCzwxQTLGxhLwHrjsD3hyV4ysA2gk0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cm2LCEH5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cm2LCEH5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371119eacso8715905e9.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 03:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772105150; x=1772709950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/CkoirfCooP2OVGzq7jy6w3vIPwFS3mfXfxd2A0Wk0=;
        b=cm2LCEH5bDqmlGU1CFDcEAYlfPhu+07QiJwdYpWhaCkEjylib10qs4pthcQnTl5lja
         btNP9gFWUEHDH3Kqlr/qE/suHXKqs15KvhT0X5hpMsCFhSo3dIzfBk+eekuFuEk7Yhw6
         iwTq4ZVt0H8nMYS/pzbbdP/aXYkQLAPQa9Xdhu5+z2+1IoboS7miq+2ainNYtCpuxw4P
         EqPlCsAEl6P5vflaR0gMFIviAmXlGSrK4C7PtW6srUdYI66nHVDdyThZa60LXXUiVXQD
         aKxd3AI+iZMJ9BIU0wRJWgBoeplr2SN455enou1+4SYdX3yKGqNT0Y3GJw5AIw0oQMSB
         xH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772105150; x=1772709950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/CkoirfCooP2OVGzq7jy6w3vIPwFS3mfXfxd2A0Wk0=;
        b=gk/xD5EXm7ywSWBOBm5JK0mEbwHF80IKj+OPOd6uiLXMWMUmaU33I7WobiITxCSFx7
         ouuMsPdVTVK9sC+ZP1L85GKHeko1eDSvkQHRoHe7HUS0KWNlSZWBQpjvIqjZpkpqIJtn
         +OCsg6pJSBqtbKKzooAjWAgN4gOYd7FdGilOaJP22BiuCENWHwYcQFMfGBnGt5UyF0Le
         JoOlsHS+BFu0bwnib7MCM6gs+c2k/Tn/AKTdHfb4HY0R9vWgD6sMXAJ9ewi4fhWyvM8O
         S73rNmBoHdIlNDZeqhCF+fcif8G77KMl+oALN0HlefVMMT3frBg4PsMwCODwfh+Z99as
         Wgmw==
X-Forwarded-Encrypted: i=1; AJvYcCXFbqcuRfx1YvgvGC3VRoc9YkQL+zRnB5f3M4DC1J1XlpYgZHPLVXWFH6JNrvY0oLRmCcglvkBXm1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4gTP9D2dQTAzO0H1MqHA0VfgRxle2F8k1FWrvFuZzO61gJQf
	JdcUJa+mr4oGqQi3T6VSfHrlcP54tt/7/VMoZ4ZbiJQcVfiUNRxnkHcU44bm17C0lxk=
X-Gm-Gg: ATEYQzyvfTo8IvfsQ0Swz0dmjQKXSOfhP31WNxOiCSm/zt9PTMtY/ZttQ83U0B0V6Gu
	vKM6QrUU3xoaNcUe9g8wAsCB5fa7pL2sL5vZpf3Zu/aOC/a4VJlZzj+6u9ZIUQrbaay5d/qIo8g
	gCp8RFzcu7N2iTxdCcIFzL+FkSqNc+rqGXej1n34Ws/46Q+LznoaugQUs8Sjle/RzCQ7JpHqRgq
	Q5QEPCiXED/b8E3YS1S8o2NtIo69+WC0Z7iBo7YZSI6ni9OaHieDK5YYrd66u+Pa50DCtW0ZngZ
	IiVjqCMPHzsunQh86u28A9b702B81bPgkKsn6uVEa6ke2PVJMU1+h+hR2IccU0gpc3okfNgj8f/
	jdbK3ElNO4PEmmK/csLUbThjMf5wsNkdUiOVNxUtr3DF3UQLC/874dSUMDVRolkjg2i33ODc31z
	HUAZBKlrV9VHF4RLCyHyuRgLM2stmsJw==
X-Received: by 2002:a05:600c:1d1d:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-483c3deae7cmr28250235e9.26.1772105150104;
        Thu, 26 Feb 2026 03:25:50 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm148537245e9.13.2026.02.26.03.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:25:49 -0800 (PST)
Message-ID: <b8705677-67ee-450f-b0d5-8e79280c854c@tuxon.dev>
Date: Thu, 26 Feb 2026 13:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/16] PCI: rzg3s-host: Add SoC-specific configuration
 and initialization callbacks
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-11-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260219223542.6364-11-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 2/20/26 00:35, John Madieu wrote:
> Add optional cfg_pre_init, cfg_post_init, and cfg_deinit callbacks
> to handle SoC-specific configuration methods. While RZ/G3S uses the Linux
> reset framework with dedicated reset lines, other SoC variants like RZ/G3E
> control configuration resets through PCIe AXI registers.
> 
> As Linux reset bulk API gracefully handles optional NULL reset lines
> (num_cfg_resets = 0 for RZ/G3E), the driver continues to use the standard
> reset framework when reset lines are available, while custom callbacks
> are only invoked when provided.
> 
> This provides a balanced pattern where:
> - RZ/G3S: Uses reset framework only, no callbacks needed

Some callbacks are implemented for RZ/G3S as well but they fall back to the 
reset framework. Could you please adjust this line?

> - RZ/G3E: Sets num_cfg_resets=0, provides cfg_pre_init/cfg_post_init/cfg_deinit

There is a checkpatch warning on this line as follows:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19:
- RZ/G3E: Sets num_cfg_resets=0, provides cfg_pre_init/cfg_post_init/cfg_deinit

Thank you,
Claudiu
