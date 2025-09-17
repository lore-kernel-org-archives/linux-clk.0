Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB429D281
	for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758097952; cv=none; b=kMy/HdfOOofi4m7cvPHhGDhgqnmFuvwGd7VEebNyYFDq/BGGbxGu3lo7k5cuELgXzxiF6ENIDvAv5UqGGR66rqfLpydDnk8AwWPflYi/6SA/UzL7hu5WA8d32MZvFl5BQtXKJGsAYeA+Ft1itO7XN08BnZyxDck8m3UuzcfbZrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758097952; c=relaxed/simple;
	bh=e1HqXtZJd/mh2DQlYKpY8+rgwoNAGd8qppLD4tEH3oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQHKugDSRwo8DZakRFA/WMswTRt5kSvKDvB7D17wnaS7dgmC035v7c83ZLOFfM67asjy2YMHUUTJjIduVanuk4UFBtq5Ov+nQsMwefAoIUb/tfnTbz50HVApmIoKjbS7UtB5/lAhx75VT2oicwCV62VSgwVTVZRvgqy+U18L+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f75OQNSn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f75OQNSn"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45f2b062b86so22978025e9.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758097949; x=1758702749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIl77ODDceGEz0pehinF+GLY6J4fc68QbX8V3FX9t7U=;
        b=f75OQNSn+/YU2eSAvwOltb8qiau0B/h1zK8q4Y4c2Kk+XXjDIQsl9JHJZchhFdggPj
         yOdkGbr2jyLbftZUuXfVAJ+J6EeoO3BlQ4EsVL7vZu0onAXjnhwrOQe8o1OiUpS6FSq1
         s66sqpMUkqyYZ6QTzpIaC8VYi9qfHSXSCEX6Cm5AOgJQWHmwE7G7pq+ZOy6myDv8TK34
         Xl5HfjqriijJ+P+kxBzZjdVBv94cYfRSokP98tpt+39TmligchTSlb6BR04pfoMRuDr+
         hLt1Md4UO8f3V6psUZSWvgBHFf4AKoQ+ckTbsfoQQxFYYhkpgH4OBPubxMAyv55YDsji
         sslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758097949; x=1758702749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIl77ODDceGEz0pehinF+GLY6J4fc68QbX8V3FX9t7U=;
        b=KS/4Gbt750l5wMo9rLLaZsBr4o3RY/HADpivm73bozY3+lgPh1F55gdgNV5OsSsiVG
         uio5vHmfACQwrJwbYmUZSszE7tXwlWx82pnfkBSuaJFaoJRm5uvT2Wm93qiDctUMEk/Z
         5t16SOU8Wue/tuZNm8U60+rhB0/bswuhy0msz7bzdVAJ+Ss03YIqzBfpwVlny8fnHsHk
         AfsRCv8InKcktFB5lDawpE6IcsyX5QI/aTS5/1lvsgqWP4v2kZyp8t2xdnxhmvCSls17
         GZ0XYIBaZx0JLw+z0TP+rJ29bktaaAmrdv7GbOmWpv4HRKiDmJj/bmx2yOa4uNQhBNSy
         PMSw==
X-Gm-Message-State: AOJu0YxdHYkGuAZaQScpfg4UcY+bcNkm3dC7dxCPPU3VHWqLe8Gf/yrZ
	7IYyCxXrdueUTF9IE9m9pe3pcs62k2g7x1Uaqj10RJTvF6h7azFvb5dDUsBx0cZScns=
X-Gm-Gg: ASbGncs6459Nc+kSWAHnfUZH7LvwXk2VrH/bKC9DUDLRAjNiPBB8Qug4DI+AwH+xiqY
	NCX9njIXrUTii9Kpr8pJjh3nemFPQi79WaRAUaGdoZsPhqEr4duHI4Px2z9DAF/IKF/eKh43X93
	RmexZtitcKt9fv2fD4z9zDaqHBQtOYYgGF/3vZoK2VeH7voZ7nhq0iSH17tvkTzp5cQByQHr7pZ
	/GjcsjuJxPAo2rA6U/Ay0/rlVpVHCtLmGr9EGH0qatYLgOZxYZERRRsqQVvDGeu34F0vf9E8JiI
	zcAl3x2hezcvCcLWh9dn1g44KbOywBn2srVpMcs3verpwYqxm0VEP9HveGOfZHGsiN4UWFHZpsZ
	FbnHVWKG6Mc2twopcd+A1V04nc8Gu41t5mpXhgFMqiBmSxe80Afe32/6D9EOiiHKoMfT+2hvbOv
	kmsw==
X-Google-Smtp-Source: AGHT+IHbchbH0zTDIhtvWBHzePerwa0GqNo06mWsjRIIJhssqnaVVC6k8oSRdp5XnAjDncSPkNhAWg==
X-Received: by 2002:a05:600c:5492:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-46206842695mr11181345e9.22.1758097948975;
        Wed, 17 Sep 2025 01:32:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46139ba88d0sm26629015e9.10.2025.09.17.01.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 01:32:28 -0700 (PDT)
Message-ID: <e30113f3-5562-44fa-8986-8a8889738517@linaro.org>
Date: Wed, 17 Sep 2025 10:32:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: ingenic-sysost: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/08/2025 00:37, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> While changes are being made to 'struct clk_ops', let's also go ahead
> and fix the formatting of set_rate so that everything lines up as
> expected.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
