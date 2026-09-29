Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634193EC810
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705622; cv=none; b=u86lw707O43giCr/OZBfA9pvweIiHD88IBzFvqVx5O9P+o0p3lqsewvQ15DpOYz1lXF31p2+0xfnFodts6pCs/6+0H4Wn/zYOdBDvOU+//CWDiokq4chOye9QhzQ/aXHD3xRa5XJjoKT9EDLPjs5byz6zJCKdP8MSNgUVntA2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705622; c=relaxed/simple;
	bh=8CXPcmZQ1kV8mbWikHF++D2g9HRdgHLNrpHDOlCAs8Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GF7NLuiX4P/+f5enbfkh+lAtfPZx909ySzFWqYzKT4BzQ6jl2+GiJn/eRzWyaiSKuJFE0psT6hmkDYQXXkd89cJ9MAKE2Q5h9TpWE1Useq8MzXgH87O2ynjwWJVk/qxt6ofPZ/caQyyT1B1qUkiI1tiizNoH69SHoJ+3BmQCMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bPes/M5M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZYU4gd1u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bPes/M5M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYU4gd1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790705620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvO3TYbPdD9gThArBooSvH6FsyLY/hrMXSQjkvo3u0Y=;
	b=bPes/M5MLuetmypeFPFeiOUysT1zJSgxVHnavUqH+ipm0qBDsOHB5e4GbXJEPmiXnPmb6z
	MIlH+YrnRX0lB9im37aED6A+bzo/W3Qah0fNcCqcej/0oYuHrcAIdiBMtJ4TkqhKaxeiHk
	9F1HCeD1MybeMMk49YyA6OWzCesgG5k=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-HOMtd3QOMR2BTCANPkze0Q-1; Tue, 29 Sep 2026 14:13:38 -0400
X-MC-Unique: HOMtd3QOMR2BTCANPkze0Q-1
X-Mimecast-MFC-AGG-ID: HOMtd3QOMR2BTCANPkze0Q_1790705618
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so942917885a.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790705618; x=1791310418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvO3TYbPdD9gThArBooSvH6FsyLY/hrMXSQjkvo3u0Y=;
        b=ZYU4gd1ugqkkaLuAfb8QyMqDCQbnGXJO7zUGA+rSGjejeDRD34zUfIp7u8akhMXh09
         voN3Ga6a0BtPDRtIb3Cpn/dTEB4g3Fdlp/qlJNfQZhRMFJi9u+QIdXKd9P1Mp+EO3gDE
         Mv8/wKfhDPHuxB2081yYkAVmUgcH63ILj4jJGVsnNc7UxxqE13oDx4hOXaJ6mmh31PV+
         sYX7vjFhIa6WKMMb5LA0dc2RQi2e4zoh1+Am4WmjZT+dVWrcjQVETM3pFacaT9bUaVq8
         t0wCuF/PNlbyoT8pWIzuIJvYooXhQuhGy4Hc9Yb/AN4NZcCJ93VfKheaTs6eWjSwjfz8
         HbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790705618; x=1791310418;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvO3TYbPdD9gThArBooSvH6FsyLY/hrMXSQjkvo3u0Y=;
        b=WXZm0HYk950T/mrGvqDBpOGy7fQZ215rbIlqAEoSF6/ZP4R3jv4CCA0UoUrpa0BAyn
         CYD7BiDaTVl/yO8Fyn6+SzDrfQ61eJvLeP/guJh47gdeJ5626U1MMV8OKfO6Wq0mRL9x
         o202s9tXYqrZMc+TUBqDVgMcOqTRuNAE3LOpe60D/aIcKFWHe+gNhXg7J0hTGceJ0HyY
         sXnNQQpeYOKGDHU7cr0lZJcHk0v/SsqQxjMB2zG0/WXYCvP38cAtLgVMwMRPdIc4WVcQ
         UFtvsSKOrz6U7bkw1AQj5Ps//+rIAnv1jfozkEZrEeFhsMfjJKmwV4CJ6Uua4ul1VWiA
         TY0Q==
X-Gm-Message-State: AFuF++lqh8KZWAbV19shHv/ib74kUsWDuMrBmYsyrGnLjORwV6ivi1ud
	OGEwstpKJ7CvDGw+T1ZUzGQjf6Pa28btIg5RJeAjDenL73iwS+4UhISf/LV0ZR0M47xbpo9D/C0
	4Yfo6jnrWCbDrF2PGLPOUoILQ18/zVT2oXWbGsaHH/yQp8J4cZbX5KI8cJky8AUHuN5sEZtPNAN
	JdLD1s6UIoKhjtxLT62440yij0oGx3dt0xysgQk9BzX/i/
X-Gm-Gg: AYBFou2PwQeSKgcyfASMZMygNl2+Jk3hSkjH8wHq4w148jAarAY71c8rgeqmKpTpGus
	ulXsCngHIJ52cWFAYcWvVQE8Hd48t0zAFHjWzW/m21dqrIvaJGWNkWjFf4qM1b0liFwTBLDc//w
	fSeRwNbPszfIAj8Rt4G1PhSTMoYfJ9JhIlVIDoYFUnfue+BETKSMUwAh31VDOMatvPVVuFpyUxB
	JFOiwcrUhAd734WSMpz36Y54UKK+JgNubfp590zPd6RKchT0GrjyWPbw3BLqz8Lpj3lVXuwkMki
	65VvmeQkaaxmOGwIFRsyu1M9oWY8JaNJ+ITtu1ofi7rhWSOxaOlwcFkz1xcMis/cOLhNi9INhxO
	fSEv4F5EArn96vE1jAPDebBdfSDc8qqanhXBiGcZfY23ycxRdies=
X-Received: by 2002:a05:620a:4442:b0:93c:23e4:359e with SMTP id af79cd13be357-93c9faa90eamr68419285a.50.1790705618255;
        Tue, 29 Sep 2026 11:13:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:93c:23e4:359e with SMTP id af79cd13be357-93c9faa90eamr68409285a.50.1790705617547;
        Tue, 29 Sep 2026 11:13:37 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f564879sm28222085a.42.2026.09.29.11.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:13:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
Subject: Re: [PATCH v5 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Message-Id: <179070556430.244235.18030041151516795666.b4-ty@b4>
Date: Tue, 29 Sep 2026 14:12:44 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=47wGTHOwHNw1GkHHo55d/Ij59Ac962ww2JNiZgwxSsM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2/z/JcHHvrsKaC5/+sXzUj+kL2Cw+y8pY4GFhKluZd
 Vvai7hfHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWwIF6cATKRoM8M/m8wsXed3DY9ufUnx
 6tm7csqlfc9qp35WLN11Y+qBFVdmSzEytGUuDfm/9O3h/q8lASaMnn/3d6X0WdRERRpeTwrd+5i
 PFQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 14 May 2026 17:27:16 +0800, Junhui Liu wrote:
> clk/reset: anlogic: add support for DR1V90 SoC
> 
> Add Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC, as
> well as corresponding dts bindings and dts integration.
> 
> The CRU driver framework is built around the clock controller as the
> primary device, with the reset controller implemented as an auxiliary
> device. The clock part refers to the vendor's code [1] to determine the
> structure of the clock tree.
> 
> [...]

Applied, thanks!

[1/6] clk: correct clk_div_mask() return value for width == 32
      commit: f036decc4434323b47b58ad9508fe27d8c9087c2
[2/6] dt-bindings: clock: add Anlogic DR1V90 CRU
      commit: 155d900e4c7d124dfc1fef598fecc6d17a1ea693
[3/6] clk: anlogic: add cru support for Anlogic DR1V90 SoC
      commit: c4e2f5e69ba4298c10ab5a64525379ca48ca921e
[4/6] reset: anlogic: add support for Anlogic DR1V90 resets
      commit: 9fd565971072d2d7158e15178f84b0273e294e70
[5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
      commit: 7849521aaac26b17820642010ab7f7a222ec73d1
[6/6] MAINTAINERS: Add Anlogic DR1V90 CRU driver entry
      commit: 5795c6059d10afbc0fbcfe3cd95676be69b30bcb

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

