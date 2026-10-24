Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810630;
	b=IHJVU5hYjyowBWtuxb3BVVHagOCKQXSQ+HE90y6jZbunrcSPFnuwGCjPvc6sN+p2sYwj
	 0hCKLqHog2996RxrZ1wWiBUXxUEWlHqCOQMZFSRHsy4/xsqw7LunEStBFRo9LFbM3K5hL
	 Q0SmXJ/8iIpEHvB6XMoSr0DwXd4Z7IvuvHJFAu0CM7L9giFGN9cbLwgsloh+QwFG0sqi/
	 HVGiefmPUHLXi9Bggpr65EN/X9TfgatsymYIoYXhGJt823cdHK1c52ovDWStC1hSzToY6
	 bheV/CBA6XE2r3LdP5zE+iwh6dfb9u8tXAQT67rFRtoDlZE92vVaG3NOya58+Ij4kqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
	b=eGzWmMq7cT87ZNZ/vxIWQvNOwlHGDJuxr9G9M250/eZlmmwTYGN3PXdzEc08DulOlFbr
	 TsPqX7PJNV+3ELVxIBYzIKZlgJiUgZk0tlYOKTwACJTMM4012JVCZnNNE5VT+gaerLXjU
	 fpJOOGQvIbLrVN5BMNYsggaXFzSzuUiiCMfYn9L/7usjLxAgqk2nourxQWLyxyvHsWpn2
	 SbJ1QLUJfGdoRe6+lQCqTS8TQtke2wMeZN9e4K5u9U/pqyGfRk5toes+sD79bi1viv0e6
	 GxbN1Gwu4FfSX+XNDeGzc2uNoYZEf8PT0AN36E4w5DpNDNDzoQNRQ46f/FENYyWWBcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BPKmkzCh;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05350606A31A
	for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 02:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05350606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BPKmkzCh
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8198a3a54d7so2129413a34.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 19:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810629; x=1793415429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
        b=BPKmkzChoKihc6iAdO5T/4xW8IiSD0BpwDr7WBsQBZL4PXTDwRMCy+lzq+uPmGvqIr
         AUnED5rV31sYOrzGpYJ074dWRG4GcWokzHAg1E+dNLtMDaqZV/suF6LoSMmEmbzSjhsN
         RWWVeWeP7IKiYJvmz8nB/gsaRpSFOHvr0+dUo7V406exuh4ZPqU9HO/qgRMRXVt4Pnog
         BRYfkbjuM6NbS4+3wY2UT3BZd8iiNENu5X7XnCEnTUH5Q68bsKy2c1c6NQaEQZgRqE0N
         N0davRMG3jx6ku739UiCyitbJRDNxddwR+iBXcBeVIw/LRy5ASqUZCtAlwDX0ZH3A/ss
         +Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810629; x=1793415429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8fxW7vrt77kAEgSKRbYezNY7nlUDAstQ7iXToVpRQs=;
        b=wfLYBPESFo09zbWoxiQdEGqJFcqjQqpUu0cL8qjnUFWNkp8aZi6VPVrNR1j3KI6M6j
         3AaY+WDC9pXeQjoYOFB6hzD5wuGW+Jdp6n8v/O1ZokB4EfRmj15I7KwNPhLtEeSW6JQp
         Y3BhV2ZfiSv48/T7IigEFKLEyWngzg4+4bgC1QaM6tMJVyQlReBloHHoLZcHvGj9ASt0
         Flu8QlXIrU5phB1MTs0xAak5JKYFbQytq1DyGdPG2hMzsqsbEhsI57vj4ZLVXgung9bS
         MaKisdLwu3/vR/yVf57nY41wDcmL3FyphUI4xp/JUTnMUhePaNnIXjkxNy5HxPJ88T/C
         pjag==
X-Forwarded-Encrypted: i=1; AKwUvByBsL6gp5TRW8iaegL5YmwnwUBXKIgtktVfrgrCjKk50XemeTIxNhRjan46tGer52ypy/3wAtkugtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSu3qay+5WY6nMk6XjjAqs8NXIglD668pENnUmZZK/uW5vge28
	zii+F3V81Il0PerCVRZsJaL4jbsDqGiWvmn4spIDL5nE1/y1cbbFAdT3
X-Gm-Gg: AYBFou0RVqFXMlnD4w8jTmzoOK09rU/XIiQjlZt720VBO7ESX0nnJf7ETxrfJWLRafw
	OwgjDqR68FF3M+zWBxKLgTKZC5RKzNqDRnQfqtrHbwk4hy2W/5dXlXgYOZelCUsqplXfw1iKrUK
	OakLM/n1ga1PvJlOdt7x3y/53xlCJyme/S/XHY9R0XfmIbW/crf3Gq0Ae8cppTKs2AgJYdmSNao
	ullsFhINWZnniz+9xD4eJRkz3NK0cHSrN8YdjM4AwaW7Bq1RTZNVoxCbIPunJKhQCTHNy31lcsz
	gHO8yyzR8486bgR3+KIjxZ7TQG/9BSU0QRU9ksjJ6tyMttTSLsXnAKa3qcOohcqA+rI4q8IK97+
	f/lt67CV9FqQWZhCfc4nCg1qJ3iyB8fXfu7fSMg6wgxoqdOLVRyUeElvJCjXmSkD6eo1JveesJ/
	xVAyRG0jgPKDUrx+05PeJ/X77svNVxdc3qWmINCr9w3MZ/yyiARAAngGpP6OYHtoxONS7vqjTrK
	HNQ8SrhpB23hVyz0OSmyPeV0gt1tLUXmK3whMKqdSkrN8rsMRc6tCfF/94lN3i1y/1hhkm1jPRN
	uBuG
X-Received: by 2002:a05:6820:f008:b0:6d3:abd1:9b90 with SMTP id 006d021491bc7-70ba0fcde9cmr288037eaf.54.1792810629029;
        Fri, 23 Oct 2026 19:57:09 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e04aa58sm1060327eaf.7.2026.10.23.19.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:57:08 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs
Date: Fri, 23 Oct 2026 21:53:47 -0500
Message-ID: <20261024025526.13339-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 11:58:44 +0530, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> [...]

This fixes the usb_hs controller (webcam) dying with an SMMU context fault
after s2idle resume on the HP OmniBook X 16 (X2 Elite, Mahua).

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
