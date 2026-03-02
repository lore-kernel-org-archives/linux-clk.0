Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB93446B0
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468726; cv=none; b=NhSEA0hwnAqRP9uPNBmSSXE0lz+scPDkrax/QsiOEVv/KeLTr9W5/CrNgTVpRfRUvnjLBWu2q96wbaMrXcm7OsX6B/xbZckc59JO2U5+2zEVl4C4yDhpGfWSwtI1gYICpgNngIIwNItNcVRExhwJ9eQM1ahhoP6jClbHdkv/pHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468726; c=relaxed/simple;
	bh=w0JfEAL8UQJ6mwvoIym34kQuZstRGM9t3S3tUgFM7p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqpFvhSEArVd0G1KuRTdQXzvZPb5yh5YpovdYDkxUNQhLfKQkaVF6VbPnDa2uHEK9u6nieGWrRsyiqibbW4Q/rrt5MDCIU3W/WYyT2gRjvajE8RG6QmuPgpeu2MWTXvkPkrz6w8V4rkyYLJxtkQIDDsuFO70rvIJYPYne1GSNvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NybzX7s7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NybzX7s7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso1278911f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772468724; x=1773073524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsRF/yJZ5HdWuSiQ8L7Xgp4L8TnqAkrXaWtbBnRsnSw=;
        b=NybzX7s7FTuQY3g/l0A65lOcwxaR2inYaNu8p9A3zaC0tf9hayJC6WzIb88ea8wx6I
         WJnkyovdWgzi8cdVZHSNLuErCv/hiAT+gmPVz1AvOxxUbADQ+44TWD+whbw/xiYgWcYk
         CrS+l47SQid4pDb/4GFAahuIcZqojAsT7rHc/GPNeRiJpbzrDY9GuH6hNW/RZiHd46/+
         8mv74ZI8ZEz5Gol6HjzoxqVDA3jO4O8DC0UzEp5iHXLO2isiIDvzZG7/xwS1o6ICPVzY
         gE69PrqTHuFPhzTU+Gb9drGfmMSS8eb8EhusyvkIDwxOP5JHn0x4in5ZQiFrhYjGfwO6
         f/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468724; x=1773073524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsRF/yJZ5HdWuSiQ8L7Xgp4L8TnqAkrXaWtbBnRsnSw=;
        b=wjwU/VLSnBS9R1Oq2oNIXcXyeOBvefy7ZDlpXwnT34JybFLP5mxIyILrWD021ZKGzy
         Z7CtqhH7atxZ1+eDFHj9X9ayd4AikGW70eSL16YDstoSaQhVIUOoBaELVfsO5HPTKx4R
         wVSRGDfL5h4GAFcwcfDL2EAagZ8loZZol7su5dIvv5Oji6H7NxnKzzqqYXa3cqnweL28
         kDJu18z4urwyvUA5pqK7iUf0sMyy9rOJYbRP7T424dzwGivC+E1sfqRs3pUX06p4OsSy
         JliGACFRqI1W87sLPV8kFwErTh8ENqlbAk4aprTobkpq/MQ/ad5LJf/qx+SEfpxDTAI/
         H/pg==
X-Forwarded-Encrypted: i=1; AJvYcCX9nxaz8gY/EHVnTmAWp/ih4udI+G+6dBTZ8N5U846SJEAdD20rkfXmSLIAt4WxEiakAnO3p45Ie1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5kYAGouWXya5G8/UG0cjPti70N+4W8YRfBPWGs10eMO7yAFfz
	rMWpXT0UkldebxLMdlqkFfsBanRjOppgCpUT9ujPGcW38Vx804wTL/2aI7FgJ222aMs=
X-Gm-Gg: ATEYQzzrvdGOq9UZ3M9Y+OwmvkY4yn5k5VB9by/cWm6iNoJL9bY52/8YuCPYs4OLQ6G
	GlsCpUMjzHvAxCcWGFXre08/SeVod18UvFJnjq7hXWcH6SrwrdY1GgJJHUEXKRMDs0WOWYmEl/E
	Xx9j/2/GZaTHVwpjgfS8yyUNJbX4/ASIRTir6boVzq1pronrK8evt+N5fwqP6rtvz94dyusGPF+
	4yM8dEPJQkLuLpR3mMX/k5lX2a9TeONm916pYE3R7g7Ep7KQQJMTykHoT0Y0PfkWKnjJWbqapPX
	k63aEq769xeRRA9O1KVwHC0B4edoXrSrIs+3sWkmv+TKElx2Ui2LpcAXbwMXFeSC3xKCeP06mS9
	jeGm74FFOvuuteAA9RIvxk3ri6AYRUyQA9uz24VIYDQtRC6ascoWB0U/Z4U4tDo6BrCDaXH8eSO
	yDQO5yidhLbuQvsQnHwAa+Kp00WzSAbVuiu+/q1CBONDj8PVs=
X-Received: by 2002:a05:6000:1acb:b0:437:6629:9b82 with SMTP id ffacd0b85a97d-4399de3aacfmr21667465f8f.52.1772468724121;
        Mon, 02 Mar 2026 08:25:24 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm5477752f8f.33.2026.03.02.08.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:25:23 -0800 (PST)
Message-ID: <3b30df38-3a68-4d1b-9e61-77a80d3fe8a2@tuxon.dev>
Date: Mon, 2 Mar 2026 18:25:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/15] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-12-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-12-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

Something got wrong with the patch description for this version. See below.

On 2/27/26 17:32, John Madieu wrote:
> Extend the link speed configuration to support Gen3 (8.0 GT/s) in
> additionvto Gen2 (5.0 GT/s). This is required for RZ/G3E PCIe host

s/additionvto/addition to

> support, which is Gen3 capable.
> 
> Instead of relying on DT max-link-speed for configuration, read the
> hardware capabilities from the PCI_EXP_LNKCAP register to determine the
> maximumvsupported speed. The DT max-link-speed property is now only used

s/maximumvsupported/maximum supported

> as anvoptional limit when explicitly specified, which aligns with PCIe

s/anvoptional/an optional

> subsystemvexpectations.

s/subsystemvexpectations/subsystem expectations

Thank you,
Claudiu

> 
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
