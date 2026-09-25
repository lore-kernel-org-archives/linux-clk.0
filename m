Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720EF44A409
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339300; cv=none; b=DdTmaJY0HR9+rxZBs5VFPpF/snHWVV725esSA1etFgoD2pEGlmAVvxlYV5rbSjf5oSDRCOBx+ljfy35LN3LHz36S9VX+1oYSm5gaVZ35Q9ZPR6B866MhbAspfFMeoZkJ+J268mQkVaiGbXLwTM41/Yl/ZD9FcZ7BVz/E3nskqSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339300; c=relaxed/simple;
	bh=Buqyin2BRLK9uHcTURSSN8vZvbm9YK/rlRX6JjPtwBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBEz657xoAXSmh3Khp56yKukiaj710Wqb3hGgCT12sYDVKVTXTTylRiyU/ScqdYyA6W7Vf8TzaVVIInUjSKazEjlQoVpiSNRbHEayZcAAV+wKdBiGY92RowHtheT45g9JGhRW79G0LAbwMXiOuWHY+ixYCW4svDGEHu1POsEj+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cZ+CLF6H; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cZ+CLF6H"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so3449625e9.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790339296; x=1790944096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=deuk7VvN7Dp02rRBKFxmXcYurefRWx2cWJSZzNnIkL8=;
        b=cZ+CLF6HWqxZws42n4qHEzDUtqdBN8Y+EjKr9/Udc5W816cKXaaRNnTFFpbkB4TaVu
         GBpGw/wt4A6ILK0yJNP/AmiE1bdTB4j5c7WHk4ymtJsRH0Eewyzs8zsrNccuHWqzcsFD
         ypQymBzvQaZgjCbS4xmdGFVvBlcvfMGhJEV07L0yvH5jyyEewWTL/xu0k5Iso9qAZqIa
         yWA0KnejHG9LAyRFvNp2jihQUxuzzn3qoCYJItBb+iHI96DD7+diK8I8ga3dg+v9BtMM
         W8ME/T0WZDaVygaDP+wiROLwdl7wtLkqKkGAj0zRHoQ8qV618l8AAVVa2QqoxL/E0HBD
         Q9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339296; x=1790944096;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deuk7VvN7Dp02rRBKFxmXcYurefRWx2cWJSZzNnIkL8=;
        b=n7v9z9S7oPrQTva5VgT4zVIwE2qZOE+35+cs344wuip+Z5y0NBzW3uEGr8h1kBKIJj
         iJIXXJaJMWcP+0e8+qAYVX1hZ5b0tO1D28J5ICpZC5lTf5+c3xfG/V3VGADT4f+OPwtH
         0dMggLUM211nJ5Tm5BSdbFdGT1YqB6Z7DgdE7xvTeIZp9JGeoYolFFs49La6p/q65sVa
         +uTdJVVW1YdiDkPBqnBIn21SBKvVyAT37kroMPZU1vx6Rp0H7U6T4Y92SKLSx4j/zlev
         fwcCvAlWZd2zAoqqYyz667VUyK6S5J0KMcOydJfPiZbvj1q6kbG/EsBeCQIqAhFun93k
         EITw==
X-Forwarded-Encrypted: i=1; AKwUvByGTyuKEvA2PhHIl43ykmAJTxIkOLZ++k9esWUAZ2gE34Hv94E1jVuz6ZR1Xx6uUYfLzDa6CdU8ibw=@vger.kernel.org
X-Gm-Message-State: AFuF++mI2yNGFQHR92bEtd2//dkN/7RCfYxFrVw9oTYRUB27aSjN7zrC
	dNpVlBz8t2kQ71w6pRK+mdZpN6A2ZAB6pN7g24faeWdNjav++g4SPCDJM/rq0Yie3mo=
X-Gm-Gg: AYBFou0u/2jPKfddScmViiWO1JkSVh1EjeFtcRM+6bHU09vPi+5d/m9JhCU0d8nyRpO
	Vy/bCeKmGudikmYXODRijLkDe9UqZDb0BbYhcAtwHdNTqY+s79pidNXOmQb0q7oi/xPjiFfey6I
	fMz+jJHsstlNdX+m6+w6P0j7AHTHz11sl21LThgOBM6hQ2BM7srKSc99uJ5i1NRYz4WcHHT1IXk
	6+zsPK7yRuVAC1DvUpIYU9kzjmuXgAp3JN+uuumZOAJmztOeQeOOErvBQvkKqVfwNeuT08ktpai
	p7Q1lHchRJefouTRs70nBuxpk6auJFVK5HoN0O7H4X98bdVY+A0BfFRLcY5MPiaV0EcvGLbj+60
	kf7VAn/Wx3XcKuMZXA2647T6jKwEaD9iCRu27SnXetzO9dZmr51VTtUqwSC8Vhg96E9kyHIgFUZ
	CUSFUHXU+5M9aG3hquvmvCi3FlpjomYKE+C/eluRsSsIhkvpsMmwoGaEPrhudEkfrpZvMj0Yh4X
	mqXQ4qpwKQvN6yH6w==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr97213455e9.4.1790339295735;
        Fri, 25 Sep 2026 05:28:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm39306745e9.10.2026.09.25.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:28:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: clock: Add Amlogic A9 SCMI clock controller
Date: Fri, 25 Sep 2026 14:28:08 +0200
Message-ID: <179033924420.2256964.9574069512756367245.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917-a9_scmi-v3-1-5ad843766774@amlogic.com>
References: <20260917-a9_scmi-v3-1-5ad843766774@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to git@github.com:BayLibre/clk-meson.git (clk-meson-next), thanks!

[1/1] dt-bindings: clock: Add Amlogic A9 SCMI clock controller
      commit: f25652a1c0d0b0d2cf6615f1aa693f7f941aff6a

Best regards,
--
Jerome
