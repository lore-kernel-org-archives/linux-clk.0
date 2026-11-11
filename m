Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409804;
	b=uascjlMt8V86zCBg57lWFb9Cjokj5N4QiH9NPd0Avn99meTRhrtng0Z7Jk+UtTyD9Ino
	 DHsQQ6Mtbdj2ETuZ7Dw0j0D0tzGDAODE2rVGUHHS6suZSisM0l90dEROS6ShjWmmxmYFO
	 9csxIMZL1Ry8VtsRMpo/t+oFVb38VDDXZfymw5vg6ZdFzdbdYFgNYVm3rn8wgWociHvLK
	 pJ0WQFRTcsCKrWSsACCN1UJOG2kuWwxHD95l7KpAL9Xe+bgx8QWXtmnZuhY8//XWg/+Em
	 +66npmWfZ+Zh7y5bEmooOFuqIjobHXLju+zqCrIwxGZmdXt1XmrAK7oNnxff2aLza6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409804;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5qxglGCjp1QH5HRooJITH6mG2Vd0Jy5UN2wcEepzIME=;
	b=OCMdWnXCS05Xu3TGDoGCYUkiuja2T6/ZswxbnIIwiwVJXy9LfTsxdzKxwoGrHjwLTiCv
	 KWkyAHhUq2HLLfsELJbH6vqbWwxrxLOp5USo8axGLDon7Y8LpCPL+XEl2dz7RMaXrDUG+
	 IHI8hTi+/KGbTZF1Ix2rkKpBUI3a8/J1D4Hx1BdEE2DJaJmwun8AIIVvk0AZuzOpZrqhW
	 waYeo/2CNSjtJhNkWNMShRssstcyvwOi49Qx1fZoOfpdaF4x55PxI+igAwwUnmDLzoQgf
	 ADCqSc2jOKRAc/Q72vEIh2VyCfOJZl7a8dbkemv4mZyoFBlStS0fJbmoQ4dB+O4IG+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7heAWDG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4382606A339;
	Wed, 11 Nov 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7heAWDG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDB11F00A05;
	Wed, 11 Nov 2026 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794409803;
	bh=5qxglGCjp1QH5HRooJITH6mG2Vd0Jy5UN2wcEepzIME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T7heAWDGjDrI7H2EZZXFGq2rVqyS3t5PzWQ7UdXMPpzNoaxQtLYc4WVvChiSHimOM
	 sOyAymonf2JpyKK55zF4TY94AKwhwey7TGqjcZIdyqtIWTvwRt6H0GTO1CL2dbAQ5N
	 8YWeYN0S6o9IBmHMUoKyHiL+tD3meBwImb14vpTBXFma/0BJ6AuvvUuS29fzXoDSQN
	 b6+aUmbQjAzaSZdtoUCLk4aT8wMlxGox1p2JOGbiuFphqsW/yDJGkJdC5xF5rDCA8N
	 W5dg8hRV3BH/ZII2Z+U+SpNpcvgt5yL0x0m7HfTwr2txm6jwPNdLYf5MNUGD3G3yk0
	 oCBYOH0FO1WNw==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261110193229.1531663-1-robh@kernel.org>
References: <20261110193229.1531663-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: Convert hisilicon,hi3519-crg to
 DT schema
Message-Id: <179440979539.1131744.14999278314208374772.b4-ty@b4>
Date: Wed, 11 Nov 2026 10:09:55 -0500
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=330; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=oham01HuQH0Falz9DHU9o2hRSZw48+az2O+RElFwX2s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+tLpKMOzY1ZnU0KoyUXDzDIWTlzkXZDC6Mr6OYWrq/
 mZhqrO3o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIn4uzMybDB6WucgoWi4r0G3
 WS63SUXi2qPZnRU2xmXvjkiJzZb+zMjwV4OledOEtKqnDc/Yu6S773Z8mFS8+1QFd5LC9em5izh
 YAQ==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 10 Nov 2026 13:32:28 -0600, Rob Herring (Arm) wrote:
> dt-bindings: clock: Convert hisilicon,hi3519-crg to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: Convert hisilicon,hi3519-crg to DT schema
      https://git.kernel.org/clk/linux/c/d17bd579ae1c

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

