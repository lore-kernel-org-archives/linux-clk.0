Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804538;
	b=IZRPbJSa0b2AoqpaQkfI6HBK/exO306q1/NVt19KINyTd6TD1YeBGgHSc0iT+nFx1s9g
	 miorlCTEmJGyGhe49+dBOmk/OKWZwpjdV0A6lqySpnX9c4Ch7FCjzmA1Mxb8zYRMUxBNt
	 9OuNOIWnj9/Eac4lqauTyUNkiESs55ogn9fxGp5l3/L5X0ORfVjyvutaZ13hUx5pNPw1p
	 f62yPXOqz0nBG7nL9R5ydArspTZBbiKGE5t4R6RftH8BOt+04ItVe7bB0kFYKO0l8XbUE
	 mSZs19aJz+DsAy3TeHCLj+bXcd/UQqTQU8ZriqB760CzdyCiYryNCVDhvhUkD9IesOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804538;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5X7WASXTIRCPfttHjRG/YMrWPQuMoOMQOH8ja1S3f1M=;
	b=g4xi/to141biXo9r2f5G6z0+YvIaE+MGtooy7+yNKQKsmEFnSbxyhVRdrFEMGZ4thOpd
	 f5q1yFdzn+1vzfAd+6GKwjCKwnitcHc5/54j5zSxdnTiPZh9e2ywCw59UZVAUWwcp/uds
	 HdqFCfo9wWUeulJsBnZqvfP5ui+Cp81iHFOwqhEXljLF0EN3yjQnO5LifmLGXq/Da3SaK
	 1laaollCMd9HjBKyKrsuM3Rwla4fCsl0V6XCRg4FGLjRk+vNHNe1jaWwPqUT/yQ9MBrg+
	 ojCZtJzaH52mIbt0/aYmKK2/LmAGiYyR/m5p5BPHcC09e+G94m2DjMqgruaMsDcu8Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jKEN2Vql;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E8606A328;
	Wed,  4 Nov 2026 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jKEN2Vql
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2871F00A02;
	Wed,  4 Nov 2026 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793804537;
	bh=5X7WASXTIRCPfttHjRG/YMrWPQuMoOMQOH8ja1S3f1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jKEN2VqljKpWLi834GyN13ZIr4pVwqfvA0182DBl45NyCbLICNbTIpmlqrUJYtQ4G
	 aQ368BF+4mWCQ9YYpea8IxsMHwaT62ExFt1AQImxUdqNyrPvDTDuU5qpPi3EPCRTW1
	 e6WW+fAvoh64Aka3/bYOG4m55pSnvZd4IMTJgjKLJAe/qfPurOSRtmMhkGn2zohBxZ
	 bCNJV77MXY90n0/b091LwBVIJUf/67gcWGTl7Q69Pu1bTx8ZrJBvP/GjOBw9gutF5A
	 QUNqByzb4Aa7n5XVdSgYdAuWclbXAYpCetP0SQtbJNg3P0MLHWFjAwBsV1i25CySNl
	 H3k8R/El0kmag==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104113249.1634063-1-peng.fan@oss.nxp.com>
References: <20261104113249.1634063-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] clk: tps68470: Convert to subsys_platform_driver()
Message-Id: <179380452914.620564.11081882005669390583.b4-ty@b4>
Date: Wed, 04 Nov 2026 10:02:09 -0500
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=305; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=olNm+3F5TeF4OyOPxAI53ijYAdcFzHF1i92igoT/l80=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJee3zRvndfWKPy4AyLlLZydvlgmRaWOXsspxf+kZu18
 SHzhd0MHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAFxEnuGfztcndhkzV7AzdBfe
 fewyt+N8ltbHky3PAyxa9NgCG/c+ZmRY96d4q1ZkyUSutyXWh7Rci4LnnHjlxmxasqJ4zsHvlm9
 5AQ==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 04 Nov 2026 19:32:49 +0800, Peng Fan (OSS) wrote:
> clk: tps68470: Convert to subsys_platform_driver()

Applied, thanks!

[1/1] clk: tps68470: Convert to subsys_platform_driver()
      https://git.kernel.org/clk/linux/c/ad8c85e87710

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

