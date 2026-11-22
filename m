Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364307;
	b=hElu82DyNyWXSvhFuSlZ/Ym31/Sa7b7pRyyEVcC0A7pHP9ER7ACVK5wGIE0QfwKRNFxw
	 QRL9cH0cNnoRPBVbwE+MqhZX2RUbZ4j1nYxa9sGWhvqwvjObH3Xjzxx+OS1An85OwujkH
	 Vl+reFRlrcIEAYrb8AXy0FQEheYMDQhuSfdcvWvZqlLbPkQrktzB8jXyIpWXGmbWv2rVl
	 jSG/Ruc/U0tejjnZiS4dHvJRKU55l99k2tCConywkheYhBb4PrfTeoDaYphboh6ZurQk9
	 ryIoAULIfq0h+FsJDaFxYNnJlcl7sBi9ImjBFnWEtDwrs5+XzEzSZZJO81avRAojBXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
	b=X4RgztzOjjV/93XGfmLwP+A2/bUqHoBPp/sqkYUdl4YJrFMZfdmHeOR7FB2cn/P+FG+L
	 jHIOHNeZFmCaiZDTTMbmvDugsIVKr7TyVNsKr8KG2lqgEiG+QaOOw/hi4swPiLUEyZ1pY
	 8yWFM9/RRPjtDr+tRQ5zIigJbQUdHilrBtUGXn5Tk/ygDE3VzyB4HG6PEG4sRATRTZ/MJ
	 rOZN66L5LiRGE0A/s0z0YDlrceBnQxYrtLR/5sIQR1EXQE8Z3NfFjh2Kys7B9wViFUhRB
	 Yt2i2v7o1oITW/+7bfew3oEmGrh7kvj7Q4ty+lMwSlXShb69ZHPe20zn28/oAsu8E7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UYuil1Jp;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42148606A320
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 16:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42148606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UYuil1Jp
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so26414185e9.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795364304; x=1795969104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=UYuil1JpVqZHpLxVePXNnzpVNmOMyOztBX7FDXfW8NAitnVCbIxeiJVUZP8fTAxjog
         p11G/SEqtyxEyjc7Qjj/QOTXD6zCXJwOznL7B8zU3HHPJAVnZpaNnqJOIiu5KcJDlTrs
         frvOwTGOHCkK8xrymAFRlWKA/3TxJNyiDi54/+y9N4TGp8opnzglrF3wlcieWPILpWZu
         PC5w+smuXMZNQ3lJ/Z6Oze4Rr1CG0S+AJSiCvXZy5eUKnHhNZJ+wVmwGskY+o2qizl3+
         VGszQjxr7HnsyUkhkhVrahUmPO+ieu2zNKrSGh4NGp1MhG6sSsu5KWbqgp49DHoE9Q44
         7/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364304; x=1795969104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=K4Gmu8mbSv/qLivX8xmUrW7KVNc3jlgqjwHW2q1FeCoUE1jfd14bdiHzM8IWsoHlZU
         4ONqXZ0eWv2+ltnF0Macco4TjUe/WuMOCNTvNKw5fxc2F0RWTyK/C8UDMkBkwsdBIVD7
         V960b92ueCMjcieji1sXe3CzrDe4WpDzAp4DZsQKtklJruhKRfjQpR+z/pUmwtWUTaAg
         rpSRM6W32/OQThfjeUgpdjmtHqjIA6HRKixC0k2dSACd/pYEfTEbsfDQhr80fAD2jp94
         XTZhw/1ps0fS5qc1a/m23vHgtvQJIY6LZeigzTLa4YbeYKiZpOrjUVaZHY30NvMH5ypo
         B5Vw==
X-Forwarded-Encrypted: i=1; AL+hErEWKrQaKqzrOR8586IT6gFz5mTJFG3RSrdr0oe3fj6pvuiP8R3Xnkig0gm3kEyLN/RjVZ3K3kT6Dgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KU8Y4Ob3xZoJqq/EPmJ0YXulbtsmm2QLl9zh/WuOMZ1nAcArV
	f7D5Koy0+wYgH+Zbia9RoZUbKFuorMP3mebo+zjmNklobb++lX4zk24+DcxBeficuDc=
X-Gm-Gg: AZFdTZfEViv1gdUfCdNAb9RzJrM6wWwFzpmKv4n5xqJ1ZZUhrSATg/sicbEgGDkmIT0
	NqryzhQJZ81TyieRa7TIfH1Ybf25CegYrVodyBMLyrOpes7CSsK/xsk4JMTmUSOrlcd28e0Uz6/
	6bt5nSY0G2muK8tj25H9TYr/c7NdIZRYriaNPEKdU+Yu+1rxKYREG2v4G5z5lwBcy2TnhAFGVCd
	yOEimtdf/i49dJMlaZ1VWg1w6CT7fU6IrE749V2a0j8yshI0MGWE1JDujkk7gigTvoJs19itfF5
	LMQahtFiFRTO+mODhjksXXn7lawrkKUZzrM/VV004QKUK7o7fYhUqSCQCchyUH+jTPUZ/aKrktH
	Qwv/gopvpJjWWwPcGe1PymPiKGXzeC2I6e4Bii3xbj0z55y51HVspmxHZSK1eyXNiSmbm7aSR2c
	hu6T/CKfjT6/Jfd1fkDXCQzRLd1X6m1+sbKotdW40EO34GQYQovpJ69eM2nn/NOWyRXUHUwakHV
	1gujXCd2UEZlhnuk7SOrVyQlQyi1dSvWcdKayM1sGjH0buluDHCM5P6PiREMiAwIqtJo/0pQA/z
	CYj7Me737Bi1ynPFcpM/MTZGe9TT91pKFjqf3+pVR55Uq48H
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr46862925e9.2.1795364304705;
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm226037545e9.4.2026.11.22.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Cody Kang <codykang.hk@gmail.com>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
Subject: Re: (subset) [PATCH v3 00/17] drm/spacemit: add SpacemiT K3
 display support
Message-Id: <179536429642.2728475.2044119204203952258.b4-ty@b4>
Date: Sun, 22 Nov 2026 17:18:16 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=207; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=v3hfU9UHf+Kw6j8mPInDkRCmcdQcn/tFYuhWer9PVLA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMouffLtac7bcg5TPvFslVKz/IiM43L2d2W3La8FzzF
 i6bCx9Xd5SyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAim44zMmxxe2hesHqmrEzE
 C5a4iu+CTLL9sfqpvwrzRPpPFr2X/8XwPyhe6sxK569/On8WiM9u/vRjfl5c4ZyfsjXJvPYlub7
 z2QA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-spacemit), thanks!

[06/17] clk: spacemit: k3: parent eDP/DP pixel clock to the PHY PLL
        https://git.kernel.org/clk/linux/c/dd010f2b662d

Best regards,
--
Jerome

