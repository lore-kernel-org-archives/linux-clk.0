Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10544372B2B
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244171; cv=pass; b=VNISqJFwzIbemsalBozEqUVdjdSWmDYxGZKJL9QuPGMZ3b249zjWdfT1G3i/VD7C2wUUqrml9xQmrblkyMAXgJLtlaqdUV/pekusIro21SKDr2P5hqvQAFlXgwUIk+w/yjWopWxmQZSY6fuAYzFVgPWHFCBd6rtKGreD40+NoZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244171; c=relaxed/simple;
	bh=K4gZl2mOhHoZykPR7kAcqsDmqgMqQEWtRL2LJIdoA/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJ0ES1Vnx46C1fD8EhpTYW//4NLXkTxI+o/Dd0zGgqhdHW8wDGSYW3z+xeqBp2nHLBWqpYEckD7kQ9GgCTzCTwaNUnxKFJCxiKII+1Umbe2r175u/c2FwO94O6ntEIrgJYo2zOGEuYG2i5GymXfVp5ME/dZauXm7rswCyXCvcGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fo2YkDhp; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fo2YkDhp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c250f28f1cdso687088466b.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 23:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788244168; cv=none;
        d=google.com; s=arc-20260327;
        b=EUAt4pWlvX58r0mFecduCpv8An+RRS7dGfBk4ZClbE2bvc11tVvLL1rS0eO59elES8
         HyAAU6tbfnGN+NO2JTqxzqo9iWm3/kLSRFP4ax6njevCW06oGZFovnfHOvHFlUjKk+Zr
         PbyF17NeNWs8wzkswHcxEF+gbwaSG1MizbKn4AzzNvtMIKiykARjzwXHjY5zgE97HzOt
         C/rx5wgzZXt5PJtpFQMPGlMfyhG3oOX4VnTEhCNy4Rm2/R/sROr6uzdvyxeAszrvZoTN
         DINeeTaby4F/uXthCR/ZQLxuLtwkqJlAvXbpzQcD7lKObJd2ERvLqR+x8P2iOQLbv3/s
         /GLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        fh=hlCXzi24dpXzg8RVe4tvlVXtQoBLTbl/QHqzVxXFmE8=;
        b=jOZFD0zc2X6NM4F/XNxCVG5O5kctD8yRkbv8C4bzPXrT0Hb0TXKACL0Gn2FV5EeNmp
         U1Oce7Yltjl5Us9aqe4WY50WjU2J5HaWiSbf+zFsTpl0+eMbbPczsHPo4MlFUCjgL7gC
         vPoul9bt5nslaf7v91BlbHcxzRuLO7ZxEP4m1ZXLl8qEbp7zeEjOAmz/jjseyP2zuYKv
         xJX6Q52l1y08k4zOifAu4f8IdjSL6iq3vgsKxaQDNWqhzkKNsdaaIKvHBS3sM4VzOmAT
         4oo4w3gv5ipV1bduAmyB/+RlpiniAws+9Pj60Z98MCKVeGR3O+4Epe/5KO7PQCwwLTtu
         mQUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244168; x=1788848968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        b=fo2YkDhpZfxnKAqDT/bIy7kMg93snOkQDUV43O92bP0KQucf0Osu7oMJS8xxDHP0po
         l8n8P2OyJog9TnxTt81NEDyUHmfJNfcliJBUagjOMFxSzHS3ThrxqxkwvtQ0TnNrAgnK
         jggJtVqkFrof6Xxl7LcbB+3MTbyUUS+MvE/9L7xCgHNzENOW8FXaiQ8ZNwoIW1Xif7IR
         3kPnIImwhJ/gHGDpA4Zqess+K0herU91/6dvhXk/OY23YasMNDhMTcxgjMZUoX8J5nY2
         C+j05AhCZlMRPXoSS8kJTXsPrZKcKRw3WVRFRCvJIigMc6G1p0LMLFegwLrQPkaHlXrY
         ewgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244168; x=1788848968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        b=magEHw9qaO00WRKPmJJ822feAjfMww7cEj6yprEn2eZ8BTZVHBPGFTRy4Vv/CktDkV
         h2X/OBm/M0+A+Sa3nU9gNHqDF5M8LOqkWho8VpBCv9v9VmrJe9TRk4KDWjKU0rql/qcy
         6jVqm4sxzbjENvRVITHot84jjdKXEQ4VKCEEh7LcYEalmvnwMUw+nc4vJ04ZIYmo4Qqx
         vKlcucEgTkkUecSaZGlL1SDEX0FCJCQNHYxthSYlUVkONpnkgjW/aXPj3as5u9h5TYTD
         t+hjiXgCyvGET67NzSuucJJ2NrMr4+OkiSo2att1hQCC7Z4Jd8VjORlW0VxkUmvqwS5j
         RmGg==
X-Forwarded-Encrypted: i=1; AHgh+RpI+6xuq19MdU/aJBg2xVX8UMSDF8dP3T1TRj/u76nGcNHvPayVDswOHCcLaKTua9fNcYuluG43LjU=@vger.kernel.org
X-Gm-Message-State: AFuF++lr+iGTPjCKDT6gijuFUdryAD0xvzmgruZyUL5hVihwnkIwClvx
	FBEne7rB6TVGbh0m4pwd/w3B1NgL/phFmNEACsNTD/pcnn6Lu1YHtLHvP6wYgkUhxHMgdskl6t5
	TvgY34bxI1T6a2nzBNVVypKUG9j5/2i0=
X-Gm-Gg: AR+sD103klM29ZPTHLEjslJGTk9OzzkhSgvqSMF3cLqnl8wb0jm+cR3noseBbRraelX
	skUIpPNRloS5dCosWuOuIfBUZvNiQnpLnupu88Oe4xpCrCeatBM/yC2mqEkRkQsHB8W3WkVq+LF
	UErJP/acCvd9zQwUDLQtxZJcM7xkB1yDP0sU5TeLwrNUgh08Mn4D8+v3Vi7Zg81VQmExY5Nwj4S
	vTDunT+1+zP6/I4bVGU7iq1+X4VAbrsRkGMYVcx3SLbq9zR6h5gnxJLWos7gd9vy3kMQN5p4wfp
	PRAccryQF/uC07pdwrPKgBsLUUp3yaf0wHlFLIJJDjJmfkyxAyGO0bA/QRuP3PsvOIzPal87CEj
	FTw==
X-Received: by 2002:a17:907:7b84:b0:c21:72b:dec0 with SMTP id
 a640c23a62f3a-c2556c61d62mr1936956666b.5.1788244168036; Mon, 31 Aug 2026
 23:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com> <178822856275.1835959.3848131517961346933.b4-ty@kernel.org>
In-Reply-To: <178822856275.1835959.3848131517961346933.b4-ty@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 11:59:21 +0530
X-Gm-Features: AcwNN1UlOPMwx9DB7E6Z2-eTZ4gj_ZRRlYulJwE9lf5s7b-4tAwIra4YOS7pijs
Message-ID: <CAA-+ukLy9CoENCEnQ0hHGzzHTw3d-aZZfT3H2o7x8_cmo9dkJA@mail.gmail.com>
Subject: Re: (subset) [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org, 
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 07:39, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Mon, 24 Aug 2026 15:01:43 +0000, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > [...]
>
> Applied, thanks!
>
> [09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
>         commit: 1c8fe8863780705aba77893fade65f728e82b67a
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Thanks,
Sreeshankar K
