Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6BB483BE8
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343040; cv=none; b=dFfXALToWIDT7fHHOYZQf9x27fxoP/u4piAkj4KM4+3SQ0uAEUtS1Li9pJqohSS/vUwu89ni1KoqlZ0oxLqr2W24WUpFhkdYt4M96TZ/dZLUyQaosLri9F4kroI4qhF9q4wQR9x5RenXkhbT2os6uPgGyEwpT4m55HPyhWs4OtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343040; c=relaxed/simple;
	bh=RhOqDGdvpB7H4+aZv12WSaqTzb7Fq4ZdIOSJHm5N4TU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pOeRavtGWHnb7R1EmJtZFEQvODhaRpG4JVdDlzUPx68njLsjRlrqHrINt2621S1AQa3NO/XirHZao0wYWx+dq508zHhCqG5+XOcR76qgQQOkfeFopUwUZy65SCTesOb5QUJYR2010stmwBTBUeOHEP7nlOR3XOESQ31gBd3Rb2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbtAL2s5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbtAL2s5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCA91F000FF;
	Fri, 25 Sep 2026 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343036;
	bh=Sxe1iJI5BfromULpAJu/KCEki6L1q1MnRuYk6Wj0Z4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GbtAL2s54Yv4o9Dy4xAE/Oc7DV8V43g2BTp5DNpOpV7g0wYEGLx2V5IMIqIteCY3F
	 Yf5yq/ftWnpvtgmmwP392fPlk1zBqdJpOrSkDfGIz6Aro25fTq7+YorFAomnwSR+eM
	 PtrAXJXAj/i/kwsQ4yjk2YR3vBcEktTl6A7BMm8ZJhVT2IeV1nHSJrJgUKphUf4QoV
	 QJcOr8fstGnQ+H/o6bZ4tGBaNnJKHlGrw5tBrk3eMvJmrr33cVS/yyZY95fIpJZDVy
	 zyEshaHIoxXpLMS01iwj26Mh8WVVrlNYEgJJAltz67RCBLXQVRsurV4Ky6d4Shk4ex
	 +Yo78QsTvDadA==
From: Brian Masney <masneyb@kernel.org>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260925054943.2964129-1-matthias.goergens@gmail.com>
References: <20260925054943.2964129-1-matthias.goergens@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: name the clk/linux clk-next branch
Message-Id: <179034298942.301050.9867709830147910987.b4-ty@b4>
Date: Fri, 25 Sep 2026 09:29:49 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=303; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=WT47Z2klYUN2i8+/wsQwNX8NvLIcFUCqxGTWZ+ZxqlA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2lZec9XEoZ/5wIILpvEb6W3Ym4ZR4KzuO65ctrKPMk
 p9LfbnWUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwET+T2X4w+3R86zs89RJexf0
 v7Rkt2CIkGW2+xD16qHl7X/LXriXT2b4p7kj/8j81Lkr1rrFbu3/rfnspPJi0cWHT046L8Mom+7
 swQQA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 25 Sep 2026 13:49:43 +0800, Matthias Goergens wrote:
> MAINTAINERS: name the clk/linux clk-next branch

Applied, thanks!

[1/1] MAINTAINERS: name the clk/linux clk-next branch
      commit: faa5022a9b122262152e7328142a6f628d2bea9d

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

