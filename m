Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61806322527
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772105084; cv=none; b=fjvUYqtYI6j5HZ+xqF8FY528D/ZyirOL9yfbSqktGMcymVPoyQujNLI6VsCnoa2JBEfIUU40pGiNHLCmOx9E3Na73iOL3vw/y84TeOYr5KEZVcQmbU7ZpgnxvtssISBFDNqvb+XbWBE1g+qm/9/IlDqtszk46Vmlk2boe5UUVHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772105084; c=relaxed/simple;
	bh=RKgPd/GBwQeJeiT3QoM+S4hvtbVzz7BLxXaDu5sy87Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5GBsO4HCnTRW1SU1F7t3ZHzhkqz6Lvguuxyi+ZU55UHgPOA25HIZSMhEm8pbwmZ6vfPD8cTOFyd8iO/ntXSjqXHJdwmuNeO0RkZ5wxQqPuFELl1NIGrGlF1aHE7iaEq9SgD4FHGumtMvPdzRi8HlGnYpou2AuKIljRPghGNpVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CzE5ERLT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CzE5ERLT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4376de3f128so505328f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 03:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772105082; x=1772709882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ODkeaFlJZUdLMuXw3JdwZWoJ6IvTuZ9KgizpGtwPzs=;
        b=CzE5ERLTMmEc6DftoP6LbcsblldbUt6uAQfCSOyEY+CfE6QBFkkXjMJnfdREc75ejv
         a8q+v+qPqXEEmkL/EP9pQyn551e5UPaFeswNW9Z3hGa7L7iJuHYjJrkxoPFcxuyJOSEI
         PEs8lBQqc8p7390JmWBNh9djNhyMFLn7N2w+QyO1B69x8uVby1e5Ez0H54rsnA+Bw4hU
         H12On//9q6aav4OmsP5YH3d9GwCzfc2B3fEFQnrPx/slUqeRHFMaDGB4y2jGBeHF4dyi
         TSoPHevGPtdDm0pRp7D7y+lZs7lc4jmYJlhu3HQ6yC+gfsHqQaobvmRlQQkfOZVQLnS8
         iltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772105082; x=1772709882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ODkeaFlJZUdLMuXw3JdwZWoJ6IvTuZ9KgizpGtwPzs=;
        b=jyxTQCZJHovLFl4B4fZALLBKJ60yl78R7xw+A3aKVl/+qHEtof5+IZuh4zDbLanVuL
         jYa1eCjdSm20SzYmJMm8HVAaJIMyeNJX2ptxzWVl4lkluq0L4yGPaIye5n3AHv0dhHYr
         qRfTGjI+2DzonEkSw1Cb1tzACkqjgkKdLWhbz7KLdtXFtIjnF94+rPvoHrSKYHi/sfle
         drEK+16Q+DKoSjHLvrHj7Ot23h+UF+W5v+tF7bdsiirjpcscFa8YiGCZsokiU2fTQP0y
         ef8Ns94qiPoxT0wONJT+v4TThxoAep52Yod4FfKiMGA7usjt601ocrkcvfj7LVvob4uQ
         YLSw==
X-Forwarded-Encrypted: i=1; AJvYcCWaxuUVeV7/kOobBZP1rb2MvWKe9xIezC8INVedJh67fg7jGyH0V/sI3aKk3evQSnqx5HGiTUCVMMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvNHDYpWQ+VubKAWL0lROmK41lu5DKGifWl0r8AS/mzmPdxBZV
	FgZShVENntlSRmba1bWXlyEMhRFT2TuR6gJExqepfmK8tE9IljHGYWm8zxVdQyZj8Is=
X-Gm-Gg: ATEYQzyNtY4nIbzhlAFv6gktCmHYGz12MMfouVntHdmHdwGsbkpDLf9Sf6CpLc531il
	RA9U/YF4OF1BHsZn8ez92HS5LC8SB0zg5EyW/UhE9ft2Obrt81GFwWiSqDsl2G/PBT2wZ9qKYgZ
	RUy7ZeP8YS1aeCLAogVeIknEj633jwh4wY/FY+EKmf659TArRUR5tViYya1ArYLj6NUzTFpdEig
	sF8iuIprV0GkKOMyIAvnbXMFGB+cIUEE4eP8L7yzQC3+s+ynnusDXCNmNbZCjUy0PxQRb434uvn
	DdMkH1i1kBUPmCmGI8c77sWBNk+VdaEt2ipMPnYSyuCNdcyZhq5o8/0ABb/v3kKwct806AaYiO1
	qj2CBN0AM61UCftvsqL1peJOcoE5nTrlYTje//KjSlU6cCg4QHr7UQaeGxEc9PzOGpi3dIawyd7
	awKiYVxQKIHg1i9xSXcTmAjz4XgeCQlw==
X-Received: by 2002:a05:600c:34c3:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-483c21bd28emr68934685e9.35.1772105081629;
        Thu, 26 Feb 2026 03:24:41 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb29715sm87738265e9.0.2026.02.26.03.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:24:41 -0800 (PST)
Message-ID: <c6230f66-3d0e-4cdd-b870-cbcdb93037fa@tuxon.dev>
Date: Thu, 26 Feb 2026 13:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-13-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260219223542.6364-13-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 2/20/26 00:35, John Madieu wrote:
> Extend the link speed configuration to support Gen3 (8.0 GT/s) in addition
> to Gen2 (5.0 GT/s). This is required for RZ/G3E PCIe host support, which is
> Gen3 capable.
> 
> Instead of relying on DT max-link-speed for configuration, read the hardware

checkpatch warning on this line:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10:
Instead of relying on DT max-link-speed for configuration, read the hardware

Could you please adjust it?

Thank you,
Claudiu
