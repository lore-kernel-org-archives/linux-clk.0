Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFC330B07
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550501; cv=none; b=JBgLC9MqeEelpH1oZ/TnhOW8dqK5tE61Vac2Rrk3ZSZdRxNxnBdnDRuU3Z3OB+2bVaphRE9xbYkxYzuu+1yEV9By/oCMiyLPwQZTvtxQMa413naWzyupnDnO68p/qr05vacsMOfjYn5mLO3X7dtPXxrjkhMG3mqgRtpaEMoAFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550501; c=relaxed/simple;
	bh=bJ6aPe/Nui+QtwM6pXeCZFiQSEzOXhL5o526MBBhQg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y81EnO0Dx1mMKmWRyuCo7LnBTp12fbxubfsYMqlBBhzuQdJnwZOppdWCPdWFN57CZzxKGmW+Zj6KIS+LH92S4YVZzAohQMV2UjyYFdeVTK8SHKcc2Ve1SusIQw0Ho6inYREq+GQoOAijlCwJT9pljxL26d5mVUY9vd7AFP7S9U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0/avLhY; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0/avLhY"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so960727a12.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774550499; x=1775155299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwjCW0nYj9p4CO0/GU2nqORuahjWsn3xAn/vBQiDUkM=;
        b=g0/avLhYWeUQAjbmFQB51pk4QoETWtzlA3Q0BknjGbf06jt/6R9vn4B3WQhXXLjZnZ
         6SQaGWu7aEj6MWXJ7Kxz1a+uPvgWuhV7AV85G54CLZR7c4mqFqNbRJPZzrMvOfk+D3a8
         hwyOO20Cpyzg4euDTEikpGe1V8t4dEqv0hsNQ7JmwsIoW2TI079ACg2e68YCtincfnhh
         GDou0kXJodeK1I+cWrS39G2RMH74/lZScCrA759yMO6QKZYiOz3ZTgvVeYXVxyfKnhpD
         pelNt5MmZVcNZbohGy8H6Nk0IOfcQ4uyhxg8hAyHN4qm4j62FffWbKzFymWQVIC3P12m
         D3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774550499; x=1775155299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwjCW0nYj9p4CO0/GU2nqORuahjWsn3xAn/vBQiDUkM=;
        b=EWWnYPlMiEMLyUxA/ZkafVeCpnGeaX2ZWRDy+yrxxZpcL5fKBJ8wznJB3z6ASYWG+W
         ui9fG83wQ072aXqVNyooVILYDlbE5DctjFP+CwlNITfBe8NO7sVGcdh+rs+dsrtjOtTx
         2owek+eSkWBDLharFF/Eaa2ceO62mxTuWgwCRDB6qN5+rrQQReEGbzxNbDOa2+1sys8M
         /eQt72FMn1vQr7m6upwZ8DTTMxerTcZsChF9R6HuORP2r59QpBRTGq3Woj8OkQwCra1q
         nm6mhczSUI7RvxkwLb3ZfEzrN7HuQecBs6cGtWu7pSbDAX6EA4QmZvMkvmlqn9rwnRsI
         edWg==
X-Forwarded-Encrypted: i=1; AJvYcCXPxgI9qhUnuf+6GO4Z9uoet7HtwDR/LnNf6EPzyYm8/64Aj2vJ3mojgL+26Tw1BSu3gmCZYVMRrXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzonfkQoYTXEAln9h4WrmZXYsSW6Qpd9ysXy8pSnfYC1YfyFpdr
	8bCiqzwttLoGkHNTHgZLFrmqRL8e360+orgHic+mGuJyzdwRNTGjSnxM
X-Gm-Gg: ATEYQzxzwOX8KKGlqpWtHraI/BotPqwLsvlSrT3Xp4vRHP8kbDXX/KnwKCIodXNtjgm
	0nsRzOJCYq2XG0wfoGyv7QS5fdtZMrJaxZKwvuMlibNTJz9qC50E2ulohdSbm7kAlHq2myT61bg
	UNQxMUUbya4CCDkvgEj1LStgY9bb/UxK2kDnHu6Wnd0PozvGBhKEHKtuZgI7hyFglOGY5PYTA9y
	S1waU+PUTFBY7dHDz09/uAreIHsKpBK7d9MH6lCdTsYnOftNjees68q9+kNM+m1uezlTpdNGyHL
	Fmd5vKW2HW+KGT8il1U2cHv95bdeBY4tgSHWpvsBXkaK455Sw/qj9OKTf4aBYmVQIdTWFFycPAw
	lcYP0tVxI2XPmZ5UPOXIOU9mDofuxohXAw+sTVTwsjAG0vNHNeM2vNWXdfC8TgAyFK73VbIt1p0
	f+vXhgk+N1POP9JngxaonU
X-Received: by 2002:a05:6a20:3d81:b0:39b:edcd:d936 with SMTP id adf61e73a8af0-39c4ab8beb1mr9569115637.16.1774550499135;
        Thu, 26 Mar 2026 11:41:39 -0700 (PDT)
Received: from ArchLinux ([43.251.91.119])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c76737f42dcsm2983400a12.4.2026.03.26.11.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:41:38 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
Date: Thu, 26 Mar 2026 18:41:24 +0000
Message-ID: <20260326184126.9280-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dd71e35d-5dd1-4341-bcdb-d082dba41d3a@oss.qualcomm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Mar 2026 10:29:49 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> > The IR transmitting LED is connected to SPI8 controller.
> > 
> > Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> > ---
> 
> [...]
> 
> > +&spi8 {
> > +	status = "okay";
> > +
> > +	irled@1 {
> > +		compatible = "ir-spi-led";
> > +		reg = <1>;
> > +
> > +		duty-cycle = /bits/ 8 <30>;
> > +		spi-max-frequency = <1000000>;
> 
> I see the binding allows a power-supply handle - do you need one?
> 
> Konrad
> 

I have tested the IR transmitter with my TV and set-top box both.
power-supply is not required and not mentioned in Android devicetree.

