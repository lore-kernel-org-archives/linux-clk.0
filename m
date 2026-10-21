Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566513;
	b=Qn0k2TG9E8UMl1Hhfh9Yz0R+xUsMcN76dIJFBxb0Q8QbytSZGmmOe3Uv2hvPM/9gB5Ml
	 7pEShF7nrP6AQPLRVc15LRrOooVCl70wm7abdFq9WnUuIZnicjXL0fwsVWeNBZ42NFHeT
	 9ffZZYJe4C5JIBs8+yTX7/DAxZaJL4/gdnr1sF5wDpNXg41EUuw5o7I2mDd6eNCKktmNK
	 5aYJtBaDACibmNl+zSNqCbryrzbpF7DI0mLgggIIeZlww0d4qundyB5wubUlDcC3BGpIA
	 C/SJUHuaUHhHSZjsbrpOp7/4Zq3eBpRHnO+RmEeZXwjx39OoStRUsnhmPFtfAYTSvhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566513;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=;
	b=1ruAazxGYfavvLeCFxJHoOjrmpiBoMkU0Jl4PI0oKIs1y3yU2nlO5Yt8t75tOMxVQFOn
	 enURxYFoWmYfDo4wV8T+422gnBbLAs8BjOQ5QNopZY8/Gc/8/bfMjJ7UeRG4h/ftucU5t
	 4D3oQ7wGh9rdRz5uEXJb2VOm94aihMQ4qkOiCzhXBMO8Q0tD9j0BtNtZigKJwP0L7yTlp
	 Vk1AFogBO8+i9i3jNmXgtPX1rnoUIxzMlDrEm3nUQAS8PcPljjHdJDH5FiE4NmCCtqN9Y
	 j6DsWaIw1a43Szdg4Bgdaq5izscFef5PjHgRL4le0cEpX91CdSd5FT8ikt8Yql4BiHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlCS74vW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9777F606A324;
	Wed, 21 Oct 2026 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlCS74vW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792566512;
	b=g7eKeWPJCUx37Zh/lyEt33nZdUnWfAG4UpswDdgKYRuMNfDyPQa4x3XEbO50Z7265e8w
	 MNq0teaD3pCUkPW4RkoKdS/Vw6mWoAx0WCeOaZVU+kHd20hzEqCcBsbzGV1DhgROWo2sF
	 7v2vjagymPIWjcLrvzxv4NI4nrXYLDckCwR52Rq5XW2BwNKdzs/hDppQZXq57rTp3ffO9
	 HT1NyJ0VrJKmbY9ej2snpTq5CpxXS9lDwbno6j+ZWxCWXCOajbHFRT7AilSpi5xiJyrXu
	 SHxFYFxnBi/kH6JmsI7ypsbNveQO6zbaEvZ2i0JjPXd7TNGpRkJBDORm12n4e3Y1h6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792566512;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=;
	b=PcuAUzN/vBmv1rN/VjJ7Qs4Pgs8bm+m/2znN34SrRzs6ZdqUcZ0I/29sz27MJCYglzla
	 yBAr5Usc8EpW5ezTJ9xn4eMW2abf4Jw3DQRlppQYd2hrqxBvpYEa7TUz+HhB9eboEFhvs
	 0NDlJtAjcfy3ly5Sjh8/d4clFtYhwECJEj8lw0pk/4/39AVMDnyE5GCMa8FyIyYOQUIRm
	 sc5vbxzndrcDhREJH8ywRqzXmX6+T8APvrdU8LevUBR8iVccvKiD3e0eh61Kyt2GxZF4C
	 uWllIzJB0rkUakoAozRyfNT1K554+iakv/3o429YOAb63qhS+oGjmhGPxdnluoulYKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A65641F000CD;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792566512;
	bh=Uwm1M5LXW/yTgu/3JOzbMxTh7fefzGQL92I4Ehs9SNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MlCS74vW0+/Tk56hwXXuvqyD5R7kq4+7z32PhoNYCsp9pTpogzj/VhHyXpH4V0ybv
	 KHMX5wkzgKZAjBhExTvrpWjjCziAJaoEjykE2uC3D72LMgMN+4O8Z+B1VruVnufLb9
	 Du7B/bBiuIYLaoj1H6MbwOWvDsS4vaJ05HVZs6/MAFM2Wd3pbLut8rysmydbIsblE4
	 eOmp0olXa8n6yKUy6PUgEQSJ/DOSyv1s21grq8fYVt0DwBznvA+geD6PxVvA9XpCIH
	 8kwXgQV6Rog7kpkjS9vLu8Bmw/tUe4K4Cg0kXYkcrlLDKolpOtsHeS0dwySUc3maoK
	 Y9l3/zOxHj06g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 164F3432F4;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Wed, 21 Oct 2026 15:08:29 +0800
Subject: [PATCH v7 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
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
Message-Id: <20261021-audio_drvier-v7-2-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
In-Reply-To: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792566509; l=851;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=DMgqU4dy+C9otoBnz7xzg+U2RUB122T3zVnjUiL76gQ=;
 b=dCsYNVktGOqd5dEGjsOmG2lMjfuS47nelfFKNm2BCt6lTYEPBOLYVtrCNBeRKAfUmbqTpAn03
 oFuHqEvTTysCXTSxRj/pA3/kvJFkPYNkTKfrUOdoRf/1oySron6CaoF
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jiebing Chen <jiebing.chen@amlogic.com>

Add S4 SoC tocodec compatibility support.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 23f82bb89750..7e053aaa0f59 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -25,6 +25,7 @@ properties:
           - const: amlogic,g12a-toacodec
       - items:
           - enum:
+              - amlogic,s4-toacodec
               - amlogic,sm1-toacodec
           - const: amlogic,g12a-toacodec
 

-- 
2.52.0


