Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB0F31ED88
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769857040; cv=none; b=WpfVJPH+MMi9/AjYTJfYLJQMk1xtJ7RvvCSdWEidLDR49KeK2eQbsDIwYS5yPdc7Qwd5tayHxMSOYjHnojzr6WytGUY4QT63p7FcP9yuKW+w1W8prHTkOG+mJp/5r1Acpr0XaJ6gmoNCgA5Rxy3hvjuM01aRZU2FMlhZrz6HyQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769857040; c=relaxed/simple;
	bh=yL1kc4lHehBzK5JPtXTnHWLnuRUych8mlRMSAbHA/hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKmtY/obY7mWIUxgXZwZrNZ+QGObU6mf69iGTZWNjywKp/RvDb6f+hOedTE0SfmhbvVCLUeuesDEaaMNHfcXsxfJEEUdctfBQAYuKGENEmSHcg/dPjeuvFO8mjmbyiqsS40qCxZufMulIaAIT8jYNqe2g9syDlGDb//S7S2OQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ghv9UGKq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ghv9UGKq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1891459f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 02:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857037; x=1770461837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VhAmn8SRPGYqUEzDqoajMHmU7OlCrx0leJ0L/YZ6tVQ=;
        b=Ghv9UGKqUyiUmkyJLBhDZ8NzWKfzLsfp/g81PglH14azRIwxbD+WUsO84vbtDjDat1
         OMiMqxi002Z14oV69N19iLi3RFKszhU67F5mi23mmo36f0F7OoQhRp1bqh2q29qZgT+q
         76qk0qHAFFN1Ki9JmhmZ25mhKaIHQp8DJHJus6UZbGVlGHm2SaDanLCXCpQ7da7q3nml
         3ikBgoIUXVj1PxI6NUFZihc9+Q4ZLId/j1/p3BUh25GF3uMA3p3azkJ/54NMAqqxfVHs
         IeTD5VQ04AwcljQLL9Xo/Ty5AkCzPQlbMo+l71NSoXkpJnqCz7Wx62tFDcsbzXItka7E
         ti7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857037; x=1770461837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhAmn8SRPGYqUEzDqoajMHmU7OlCrx0leJ0L/YZ6tVQ=;
        b=BdCLy6PoaWz1EfrKTcjHn26woblIoQED7mtsILb/cUFwZTkVaAbTCvzZoc9lixZpTW
         N5IAhn06pPQfZ3dFetWI3+Pv3WIFgFxLiAATAUnbdg9Je34vNxjxKWezGVNgkHS4HPwN
         HT/zV+lY1O3SAMZfZBM3KnIqw+Ix1G30XWbQ/s5yftlRwdZ9ImDZL+9Wvhb7Usw+RZ12
         aVLgztbdOEWCqwMvL/x8jMcHfxRMxBxYe21ifYPoeogylvVzIBCnjmEUhlqOkfhqld4z
         0Ik9i/FwxySn48MiVwy0d/qmbDBpsy+QD62w03JPpy5/jD+/6HsWsvcO784Yz+F4Lv6+
         6tdg==
X-Forwarded-Encrypted: i=1; AJvYcCUGF+M4m3C6F6pz6WSYXqGC7lkNMvdyxLgip8th+fUWcj9T273aWG0hbpbwMHhWUm0FSIndGt4XUg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYJR+8FvI+Mxi61SpBgTnpqhVjRqV4MxlAwEGJFJyDWVhEVVcf
	sEZDzADhw5gb7Nkb6z97tkOPk5sM12QxXYdx+1h/4aAk209MU61Dzzs1Ci4TKRn74ek=
X-Gm-Gg: AZuq6aIjRAunYGO2X5KsEQM4hU8n+3V1iDNJ+seWRWQ7bTbekm6OENldcDqbApJ1IDT
	Z7rXJtJodRbHW7t2ChtUeIXXB4kh7Wctim8MAMvBTlihFmqJ5B7YcTl0R/JmiWeo5TEuueo+lmN
	POR8cHuznfGiLCsCkNM7WDmN1hdbR/Nyfw/uiDKNRDNhfW7/7n3Qa2dqhtsRRidZ7DiDX6Musm0
	vNwpywURt8d2AJHefpf+fNq8T7toJvAZIvxWGf85rG3PNN8l+8sl8x/FQkElBYNGYFtzk/11lWR
	zj9Kkdmqj0+tuf1qaUkQsN0YFhIMADQUKyMObm9rFZaiw4jDaa+p+KIiG1SttWD90ldbNXfjKwV
	e96/lL3OUxhzyysUYFZDCwYsiqlnToKfTMz4SEAepjy3d4/t0nKaGJnTIuMpY3t7L16XPe2YbMy
	h70Q3wWWlQ+QBKUahunrB69jYlirMnaJb3QIY=
X-Received: by 2002:a05:6000:2310:b0:435:a594:33dd with SMTP id ffacd0b85a97d-435f3aafeb2mr9320664f8f.46.1769857037212;
        Sat, 31 Jan 2026 02:57:17 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm31437266f8f.19.2026.01.31.02.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:57:16 -0800 (PST)
Message-ID: <1c15207a-b378-4fd0-bc1c-5ffd430dc188@tuxon.dev>
Date: Sat, 31 Jan 2026 12:57:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/31] clk: at91: clk-smd: add support for
 clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <92f9e1fc621d30e9692f2d398372b5a862647d40.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <92f9e1fc621d30e9692f2d398372b5a862647d40.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_data in smd clock drivers.
> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-smd were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the patch description adjusted as mentioned previously:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
