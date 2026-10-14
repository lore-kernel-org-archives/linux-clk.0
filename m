Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47B4ACC9D;
	Wed, 14 Oct 2026 22:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017248; cv=none; b=tYKCXno77AWv9g4a8PIeSSkFFdBB2FflOMpLm3CA5gj+zUypIi3RCwGfermpF6L80AgSUcVX9EtgAJxAD1QlxKu+Wh0G7uQv0sWLX04W62JCNs9LvFh56JR2kJwVCdYOpu9bSTcqze/i4rckkv2dRAGI/o7MQgJS9kCDaOl1d1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017248; c=relaxed/simple;
	bh=qyZyZStaei/iZI0xFQTrGvIBCECbY5I+foMfAvbgtVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u1WerPLbZnpo6e3kXHqARcHkHHD26wOMBQ0bxoaP7QT16NE1xUB6Qr9Q3Tgm+BI99PybiivXpPMaDhWHglT32WIRHiUpCzJyj+JE5koAvP9PgOyGEsPHuEDwXSQ69iWFSoy7U6ySR1fXVmpc8WV01172HSfCgvZgsY5RehA/kZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpYIHlHN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpYIHlHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9A21F000C4;
	Wed, 14 Oct 2026 22:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017246;
	bh=oguqPZdKOMR7GvqAIEyJ5y/sf9i1+ZyikZAe1Iv50xI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SpYIHlHNQu+pFe66njndzV2Fb1ULTzxDbLHz8/B46qnRLHEunoYKSz+fELvGPWrq3
	 3P2bc/tCE/IWu+6uZnFLfvrhVfCZquBfsJ8JXuIKthtuNESGIrXrKYhfeNe3wqQ4qm
	 qWq8UmnSqDW60VzXmKAHlRaN0hyskC2l28VB+F1rG+6kBIxzTica3eZZ67eUQtEZut
	 38lahGfK/lBUkTab7xFZ1rD5wFud8J7Gr3w4aplTAYEkzlC9o9msa7micSDbS6h0kp
	 o51JAATaBIeWcHMlH2rlNJPZ2Kv25aiS7UyHxemFTDutDfj7eVhYqiZ0Y2gBnsXI63
	 d0+JvBAKlzrPw==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Michael Turquette <mturquette@linaro.org>, 
 Mike Looijmans <mike.looijmans@topic.nl>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014-cdce925-truncate-child-name-v1-1-00136be00c49@baylibre.com>
References: <20261014-cdce925-truncate-child-name-v1-1-00136be00c49@baylibre.com>
Subject: Re: [PATCH] clk: cdce925: Size the PLL child name buffer for any
 int
Message-Id: <179201716293.336487.6956882330983194149.b4-ty@b4>
Date: Wed, 14 Oct 2026 18:32:42 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=+3tlGnqcqw9ABUSgWgNk6HsA7o3XxjBaOfeAHU3cTvY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIuMIcLO09knds28V/ltroFDFGPNZ/aX5S6kJ52osncS
 4j5wnqDjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaSXcvwV7y9pfNSS8fkq9Pe
 /F7W/sl+j2FLsL3Yb4+9a9+3s97qOc7IsLTRTmYfR8zuhFov4dnCetpd3x7MnPOBedcet9P2p3Z
 uZAAA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 14 Oct 2026 18:11:53 +0200, Jerome Brunet wrote:
> clk: cdce925: Size the PLL child name buffer for any int

Applied, thanks!

[1/1] clk: cdce925: Size the PLL child name buffer for any int
      commit: bca4927f760a77cd59f394b0b201f48c48e402c8

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

