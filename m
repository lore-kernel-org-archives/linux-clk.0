Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270765;
	b=T7/XgWMXeMZ0aEqWBz6sgYrNeFtuSqQ96KKXRgsqJoIhTVOgEcz0Cj2HDWLr44q9BAMZ
	 LzPUFMW3e7yT3egWH0pjypoY4GPgq5OT9nOOalAxMIQqBNjwL67ThD1Qx3DKYVJNJSihc
	 VKcpiUxatvFP3Q1U3Lt8OJ3NmEDbmrJd1KIyg0S3DHOCiXzi4MINdpN/M99LfKr7Xwu0H
	 XSvvshIJa5CSTPsqb8VS/LuDK6cetNR3ltajHTdqHEENrWfD0RrHs51UPdhIPcBujotf4
	 7oTvPN2A7zDx9DHUVwEFWg8iVW/vjs2EfHV0Fl3gmCfNAq4BMfAHXN4o/W9RsGExoNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270765;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lm3Ckk7zUBa3VuCIO2Nipzzmy/lvR/uITmLXcyunhpU=;
	b=zWZiGAR3wA2jP+gfOpTDGLlwtks1xleo6pNlvIENPO/Ja7OqQBqDJgO4OnFpOtTpospW
	 ZWOHB7ZLr7JpF6u4BmdXwwfM3Dttsvd8cY7nzRhQYvdQF4hgg6JTICiVU6XS6nbRbsbu9
	 m7aI2Ea4TA3FVoi5oZROkuehtRpjJM2JzEvnFo6N7eFDqtpXFaLYUdenKt1hl1P30LOkB
	 odacGq+Uhixacw/9qRqF6slJuit6luilzvEEg37CAX7WpcA43i3AtRlhRnPeTqNEP45uR
	 bjg9gac9B3Y5R7gjcF4uqcWa80JAeX66S0RKjcclH4P5hNNA+emYdyJ6kviEG38S8iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JheiXGj6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81EA606A321;
	Tue, 10 Nov 2026 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JheiXGj6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980A21F0089F;
	Tue, 10 Nov 2026 00:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794270764;
	bh=lm3Ckk7zUBa3VuCIO2Nipzzmy/lvR/uITmLXcyunhpU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JheiXGj6l9y8XIjpQmdnozxV373gnIyMnzfKETdwtmg7pD1BRcvSI0G4ycOKMhnb6
	 MTPqRV4rSp5ZQcP9yafARmjNdyvQ75y7atcy3t0Eai9L6uBACFsX0BUZD7XkK7ZUH3
	 jzt+gL4iP/zk5bLxUzUUtQ+MmfgDJ1ghadY6o8C2O9nq5KMd6Nmq9IHdQ6EDil+35H
	 aKaXtQqHzkuvPznwgcNJMptaGfbUXtJx29DzXGNGp0oX3J6DgzKSzcrTGJO5KPoIVm
	 78M3gZI2cJd3FpgHu8pvafdMAqG0AKQa5DfqcRPAfJS598SJokUOxnjYaK7C4sgRG8
	 MqYVPu59bhhpg==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261109184424.446496-1-robh@kernel.org>
References: <20261109184424.446496-1-robh@kernel.org>
Subject: Re: [PATCH] clk: hisilicon: Remove hi3559a driver
Message-Id: <179427054156.1057938.7033647270404048226.b4-ty@b4>
Date: Mon, 09 Nov 2026 19:29:01 -0500
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
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=522; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=eZH10hqywnwJONZdj1fRHmCIecziilOFt/pDp31VKRk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLI+palE1k3aLnCT/Z3QP/ldG/1d/4cU9GgqpM552fm89
 tCO6Lj7HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyEz5Lhn2Exb5LMmvXHaqKk
 JNI2P+S7FrYpf38Fy7c5kef7t0cJszMyHN5os+sv37Z/0/JWbJ9XUf75006riXmH994LTdHYJJE
 rxgoA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Mon, 09 Nov 2026 12:44:20 -0600, Rob Herring (Arm) wrote:
> clk: hisilicon: Remove hi3559a driver

NOTE: The clk tree is based on v7.4-rc1 and this patch was based on a
newer branch that included commit 4dd10fbbeb9c ("treewide: Convert
devm_kmalloc() family to the devm_kmalloc_obj() family") from v7.4-rc2.
I resolved the conflict.

Applied, thanks!

[1/1] clk: hisilicon: Remove hi3559a driver
      https://git.kernel.org/clk/linux/c/f4897f9ed38a

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

