Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF62690C4
	for <linux-clk@vger.kernel.org>; Tue, 29 Apr 2025 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963085; cv=none; b=nN7iBSS1Q2YYhWLCxqGJUDZQcREEPTSZEK54ggzgvCkdqYaoURsa1do72Q7kldKninlddolX0JIuadLOXx6keGmROnjwuVor1q2kXft3vkLO5bhHGac9EC+n+pKF8QBHz9GVgwq9OKxLG3Weq34xciPEu9LRPtKpU+sK8ZkZvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963085; c=relaxed/simple;
	bh=YoNC21QRpvSFFog1sIo2pHLhmbI9Jf1P9KZW35k1YSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYXl0ZeCkHZmCWmwrvJNiO0uPCbUV5ugdkm2ZRHP6H93uHiMJXUkO0J6QNd0FEKXdH+pyCuS4qPdNE2N0q4aTpLLfWmWGltYQExndIlUrBNIoT5cgMtWk7lrNg9Ls0ac4Ocj053E/BaKBmOvEV/TRqS+IQKCr5B8qlW7wjlhN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ad+aQ2Dk; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ad+aQ2Dk"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-861b1f04b99so212927039f.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Apr 2025 14:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745963082; x=1746567882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jR6+8yIAI0O5mZLd2KMAqTdJoRJKX7IRlTHsSNPOZQ=;
        b=ad+aQ2Dk9evFMlsUNRG1mNIaW6Lfx/SaAxPYLDoVPK1uxuq7hrZy/dDLR/8Jwp5r0U
         u36V7skpZGNSvLdu/ptpNwh64XSD6GVmvNqCAp0AftDfqE/3UyHvkM+7biuUafbNTNWm
         F/10nSnjBCKZXVm2HMYCKlo/QHZJBuQZy5Jp+O3ujKVG7ru965qyaWWBCHl6Ku4H9IKW
         UaGJqqKBXU80TMxjClFQs4zkwOycP+eARVxunceFx6Attr7Q2RO/DdkWK5XaT2G9vDLI
         y7nCBcFQkNKifuOvWudYxrABJ8q8pUz/tRDHFy7hvXWl7YoLaF0JPLg0diszkBqPPcxR
         euig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963082; x=1746567882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jR6+8yIAI0O5mZLd2KMAqTdJoRJKX7IRlTHsSNPOZQ=;
        b=hJIs1XR27KzSFCj/8KQmybfVnsiv6oxwbESmOT58GL2e+e4A5vpveF0/y/ua0vKVxk
         zDgbboUxuBKCqF9pdd25Wsot7CCnXQG36VyhJjInKFK0cFxKbb3qbflX/hsrreNhol0M
         vXJfM4T0MZfT4cvCeuemQfu20w/0znEyh8zNFYFd/jwRmT1mDdn0lXF2PG8BRRo3c0dC
         NO4XVKqf5PxWPq/oPxegeVxoUXH4zLCJ2SForbKxjbBcUOpdAX3VbgXf/C/X99S9i/V3
         hzKhH4jDdBB2qnUsSg9NSftRpkx7LkjIdFVqydsLu0nuvKQ5TocpA6sb2RoWR+Da/11H
         WRpA==
X-Forwarded-Encrypted: i=1; AJvYcCWuS8N8OlUYf5QWviJSGSRh/QXD/0vIQhDf72xNhOOqqJ0IpQs7iDpF7axgVkiBAvuT/gA7mYjbjuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwExK+F7cYelKf79b7e1lSGui046UcOTUGyLxg5QvFfDMNUAktN
	gz+HVWr2OB7/1uwL2vXJcdsIjHTfavGbvH/YEiPLrYwTSkJbk/KRamLJDx0AtKk=
X-Gm-Gg: ASbGnctGTGpkL1j6Mo9/uDyTVfMw7akDkHSLxWkXEQ7a5cn9S98muiz0lFXtNds4hZl
	QsOYs2FbRIsqlQFUH6/0PQPh74wBCh+Zqpqpqm+FfvKxWZbm+0pDj4neI0ilR9Hde1ElZPH0yV5
	YSSEXyXHbynHioBZgO1XTktkGG6DrPWkwjleGFwcxBe/gQQD443p5NnMdvHBjrFEaWvWG2ALwdC
	/gbnarNyNxk1Jx7hrH29d5EWsc9XWR54N7XXr9JeyD/wEJXorJuqoEtbosWl56yTOLQm/Rccc70
	kFVunrM9PcMmOxJbECwhSrPbThtZccat68F5ipXHrlF0xDqvIiSSqHeq9Xg2bg1EzGJl5YQUgaM
	wn3vr
X-Google-Smtp-Source: AGHT+IHC804e4Eix/ozoxmgLuYyu4h8EDtpYTI9mJ8DxF3AanIg+BgD1P4qKeHonfHu4YLobsYIF/Q==
X-Received: by 2002:a05:6602:400d:b0:85b:577b:37c9 with SMTP id ca18e2360f4ac-86495f0f44emr144632039f.12.1745963082607;
        Tue, 29 Apr 2025 14:44:42 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648c1df315sm42698539f.45.2025.04.29.14.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:44:42 -0700 (PDT)
Message-ID: <8b345c2e-876a-4528-b8f5-fe97abd11cb4@riscstar.com>
Date: Tue, 29 Apr 2025 16:44:40 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] clk: spacemit: add K1 reset support
To: Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250418145401.2603648-1-elder@riscstar.com>
 <20250421134218-GYA42923@gentoo>
 <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 3:57 PM, Stephen Boyd wrote:
> Quoting Yixun Lan (2025-04-21 06:42:18)
>> Hi Alex,
>>    I'm good with this version, but would wait a few more days for
>> people to comment before taking them..
>>
>> Hi Philipp,
>>    Since these reset patches [3, 4, 6] are sitting on top of clk driver,
>> I'd assume you're ok with taking them through clk tree? I'd plan to queue
>> them for 6.16.. if yes, would you be able to give an ACK? I'd appreciate!
>>
> 
> No. Please put the reset driver in drivers/reset to get proper review
> from reset maintainers. Use the auxiliary bus to do that when the device
> is both a clk and reset controller.

OK.  I'll send v6 that implements things this way.  Thanks.	-Alex
