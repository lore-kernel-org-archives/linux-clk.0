Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452953;
	b=vtV+jAhi2+Oo0pGHWprZb4UgSCr9Z+HX5M2GLDRt1PIgi46Y1tLeor6c6tsUuKUhgbbj
	 bHLflUpsbms2kwn+iO+LMosVywo09/+ncUbEIO6bICM9+ES3Fpqht6444Qc6jHTrW6qJ9
	 gryVVL+hQbCOa48yUL6/Dx0RvLhuTeU3s+62TZoqFJ6pRMEryYsUKSv0VemwS1VUTI3yB
	 6UQajyKCWUAR697jQNEy8jykCQB/tT3Qh97c33VK+0DDhp3Ld0iqWBM+9azzVgBs9c3dA
	 +UqEweQBQLpzuBP5EZuPv2E/iZcFMXR3hz7LYubnNPb/kGSamj0yoQATTwfDRb/If0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452953;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DVuO288S4OHkKdmhORY1dPwKToeS5NVnqdlS1+sSYF8=;
	b=zLup+8pSwWxpiypAnpPKUOJ85tBcSuO2MeaoyFhZg+AJo5FhhjY9KLNGtURDvmg5QzvY
	 vLzzu1mo9dl3XEKqDgOq8H4tVIfH/3GJt4YubILcPCmoDFVN5YyMWubbp1m5tTkgL0/+h
	 S57nPeDxAnhCetK1XlJCItoMOWjDoBY1Uwsbl73VlnxNq6i4uu7X09RmOHOU5lLs/SMt/
	 KA1YL99fqmge92zpEfvu+2+jSExHdKGVUJiCRKtuEHZWValgeu9aAA4IYNO6+5fBxz35W
	 DCuzX/S6XJ7QxHXer3lsAu0qwNw5gxLAwYoR1ZEvmgVF7voEv681M0lT3pQD0LQJXaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQnLsAOF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD56606A31F;
	Mon, 23 Nov 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQnLsAOF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C58D1F000C0;
	Mon, 23 Nov 2026 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452952;
	bh=DVuO288S4OHkKdmhORY1dPwKToeS5NVnqdlS1+sSYF8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NQnLsAOF6LEkdxRgrWA+Y6Dd8hDOrVSQ28JC2tOvRkADqHKyOrdSs7yQ47vE55y3v
	 wR75XKuELYqRHeSnS5JvN1upBWMBTIFDySyNDdcPrc+825ElLNQtfMqq7UBVf9T5Ek
	 HE2volKb9SVQYRAAFxyMcxOmjieGVzbHnohAYMePuqzPaJgb+VsFmCMr3Jwbw6g1ER
	 Xv6aOijWTBdX6XEJXT5SacatXj1VBOhcIVXqkjt7r4b8RXBRIkSMGq9XMvppvkKjam
	 qs52kNGtnSkw5zU2lsuQlL3X8xZTYiAuenrf6u/YIu8gMwfL0RW2JofUMFiIqFm5S6
	 sDsugy0srrUUA==
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
Subject: Re: [PATCH v5 3/6] clk: cix: Preserve Sky1 AUDSS interrupt and
 reset context
From: Brian Masney <masneyb@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.murphy@arm.com, 
 sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 tglx@kernel.org, devicetree@vger.kernel.org, 
 cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, joakim.zhang@cixtech.com, radu@rendec.net, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261120053529.371923-4-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
 <20261120053529.371923-4-Jelly.Jia@cixtech.com>
Date: Mon, 23 Nov 2026 11:55:36 -0500
Message-Id: <179545293652.209212.13817685318206713956.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=624; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=dlN8f5waGDkpgx6y+Hr2A3mh8IFsF1SXgakq51pTHIs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZCnj0eiaWdbxJfHKr9OKuiLrVaT1LmUIiBU+uVVVJ7
 lFh+BjRUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQceBn+e0fsncxTtr3pT+rq
 2R9lmM35thsd23BggXjdq1SDnReOH2dk+FzskFH0sGj/R9NJzV9qLrb8X+chlzntd+9y04iMKuY
 SRgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> The AUDSS CRU saves its clock configuration before runtime suspend, but
> the save list does not include the AP interrupt gates or software reset
> state. If that state is lost across a CRU power transition, restoring
> the clocks alone does not restore the configuration of its consumers.
> 
> Add INFO_AP_IRQC and INFO_SW_RESETN to the existing save and restore
> list so the interrupt gate and reset configuration is preserved with
> the rest of the CRU context.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Reviewed-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>
