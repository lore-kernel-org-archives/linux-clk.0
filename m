Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793584005;
	b=UDusG+4k0V73CrhfQaPJNoewps2mtZeI8Motf1KsW5D4xCqWguZUOh70KnRY2CncDfF2
	 DtUEKl7ScHbcKz5UZGlDnJz4RIBBbAFc3QBkqqS7p8XUsPZYt1llLrKkSjMS9phldbQRj
	 ULOpFBwgOc5Up1g8f+zXDacV7tu8Mywen+vQ0wEkoAcbf8X0XBvOs4NyoTZex/G1czwHk
	 /3c24qjIwHCwb20tS9xwCjKr3SyNeX44A/g1gdmqG+rfMCWOB4PEZ/HZJnZC3tJYAvZ0L
	 aBBrh87rTuKyKThHf+s+uKcuOcsNeb2+AIjWhJXsduMQCOPEtZRRsgy46vDYgyVns1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793584005;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gnAaNPiAfmCDCwKoKWpI6EbNVhYe71Fv8UCk8mW736w=;
	b=jm4h6P9NjS9f+qQUCrt9QnhvrCHhrvSbRUftcc3PJTULc02bEVZk4XuygFHkgEqxW88Y
	 IrpGlh4tkGBTpTQKaol0l18dtkfcRhyCEExDmrRqWimUcvbTNbHd6HtRZB2wVl5R5xIO1
	 DQsBZDomus37zItQR+g/FRFgjvg34hUWF3H081bYi8MklL3ieKpHFFHvVK+dv8EcgrmMa
	 SaFkMU58cZO97lUVsGdOomH3cc86P3JqEyqZ9mjGMHDvRki6AP4IS2OiW7aMou6uovPX7
	 GbzOVDJ0snbcL98AhHBq/JDDs+TvWLAKhNgYLfRmO+qEGIaSzfnAPiJbK5qwb2HxcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkAxmfdP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FFA606A324;
	Mon,  2 Nov 2026 01:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkAxmfdP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A2D1F000C1;
	Mon,  2 Nov 2026 01:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793584005;
	bh=gnAaNPiAfmCDCwKoKWpI6EbNVhYe71Fv8UCk8mW736w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BkAxmfdPO2SZDI1HX327DOP3HSs+KjoTxWIS+KIcBBizoINjoqa66raTUl1oaae0u
	 mOSWZmkcZ07gMF+u+aANG9S2yFtxqYPUWqM8Kmu+CFnNhq0jJWatTqkEvnEmi1aBJc
	 irt0lt/eqEGyI0BjnfGtiZHHQOp+UCMsQ8kr3jJQmd2uP1JcmmFOQHMfYYeyVvIVpZ
	 4LnFkR7XVh8Y23CWDNB3QQnMXRQP2beIgmhtG7pa4y8o7KO2GieHnAosVsZTDCK6Uo
	 ibzPFRRxahQumMbOfEBlo2JATuz+6hgNYdPSj1OWNDUEQM/kRbxztXUXTZfDYNIgqr
	 dl8nDW+3ohkyA==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024033904.830766-1-nickolai@csail.mit.edu>
References: <20261024033904.830766-1-nickolai@csail.mit.edu>
Subject: Re: [PATCH v2] clk: Free the parent map only in __clk_release()
Message-Id: <179358399645.349160.15564505985516753012.b4-ty@b4>
Date: Sun, 01 Nov 2026 20:46:36 -0500
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
X-Mailer: b4 0.17-dev-5d8fe
X-Developer-Signature: v=1; a=openpgp-sha256; l=305; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=ZPy9wSePj130u9em3BtZwBX2LlJftjvF/zgau9mlAeY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKev657w9o0b0bgv5fXQxz9J81fUDf7luj2mR59C2tij
 okk7dDN6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiSfYM/4v7/ledfsD5JVH5
 kRSrm8xL39OB0iIJ507YW/7lF3pzrIWRYVr/DXuXlkvlh89K5Z9e5xPc/OXg7IWqWZP9MwKsTdo
 +cgMA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 23 Oct 2026 23:39:04 -0400, Nickolai Zeldovich wrote:
> clk: Free the parent map only in __clk_release()

Applied, thanks!

[1/1] clk: Free the parent map only in __clk_release()
      https://git.kernel.org/clk/linux/c/af7ffede1ff4

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

