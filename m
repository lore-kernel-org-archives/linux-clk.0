Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792955940;
	b=kir47eH16eizPxHd/Jw+bjBSEqm4A+mJKRhUV9A7KsHV2zL+B2F30i7FztQMMLyhqwYO
	 QpYT9Uzr/ged7ClcZq1NFiEvfiJQkckCkcqn931bS6uIvPnLkRB/UuMtoTqxd7apbOQX0
	 QcoOyCErIH8NZBhWmsZqKtEdaQcYwIYmy+C1YY79cPERwSMu5HgJywF5zfuxCFS/BSLOy
	 +PHtqJIC8kB2micoBYVEnSYpopfifFS3Z+abqGoxL2aHUgpp9ffu4q+xZSoAtIPaGkZtV
	 1MoXK7Cnd43CCaFSHWvbmYfvV5I+xvuoAguLZ2zjPZ+SDkIWtMapvLoI7TI4CMSxNRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955940;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=36Gtei9+ICpPfGhUgPGYOlNssQ2PGoXOIDVUuqX1iYU=;
	b=ZS9qA0LbZ19lZT3HjefiYY79CnPZoa64T9dr1hoaoZsdl/yNCmqGylo7MhECGpZmPqWZ
	 mdKNm1Hf6/t72LwDT9TSuolRlTRYQ4DbxBnMCY5vLIDLAw3txvcrCTonN2xxFMbVnlFbP
	 dC6/gLxB4c2I9R6B6B10B5XPxgRl5q1tuks/R3Om7FxgKLjFA6FFFhuvsCduwRlRc/iMS
	 7jceH98DNtVcSupzRDx0yHmj4IRSx43dfJSzfIMYig8AhYvKl+uInI/AAGwVF/cT+0hR2
	 uJ5aMsTzXLrz5eg4dU28iVT6ccrogm0Oq8JUWPXDgK6J5bW//XSDbq3e4M2+nr0lMTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="oaEc/MpC";
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Vb1FAuU0;
	arc=fail smtp.remote-ip=85.215.255.82
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A11606A32F;
	Sun, 25 Oct 2026 19:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A11606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oaEc/MpC;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Vb1FAuU0
ARC-Seal: i=1; a=rsa-sha256; t=1792955915; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=d99IEmIYWgFUj9XAfaR0y4zti/Oj40gMJwbAXgzqdjW6JMrHzHqdZXo3Rd+rng5Lql
    NRm5PEa+t7BssAyzDpiuwdSQ0lBb8NyJJ4hcB87gIEDDj+MAccDFwGrFDcefLCc+FTed
    vUzKiUfioEx6YnvFFWd/0znpmFm7UY+O1jA2CuI0rqunc8/xI99+i/Og3CtkhAyq6Aj2
    bRow8brcV6myRgtVA0nVbuiDFb6foitYQDXb9V4P2Dz61XORWHEK0RZWQEyvKhs6qV12
    +fdFOXfNEoaBA5uwwkGa8ypjABhhePRlbLYFoBoXamVK5n8qkMiEmT9BNgREpQbEKWhQ
    5V/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955915;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=36Gtei9+ICpPfGhUgPGYOlNssQ2PGoXOIDVUuqX1iYU=;
    b=FOwhQ8hCgajn+CI4hmgmvvVRLYTAsWwNcwGgG51Ux3NLcq2JiJlsSZFCDfQSnyyNN1
    1wtH9WZUXiYfv/5mY8bAGfrFPoxdL+G5pTd1m6OIMik7BRwam0G9PiYLh378uaU5ECyC
    DIGJbSe3NDZoO44CSEpM68WtB+48/YEVmYJ0csAbnigainwcddKST+NwelcQKOW5QL3F
    jkMzsMiYvNsYL/7mnXw7K07A6FLy0KrpiEBlfrbsAsovaPNgkgrKV17Q2boQm/hxjxZG
    kAyE9Kf8lSUm+n7F5iaSu70nU5hp649uzxVxpwMTSsVVakF37CVqgiyS4huH2jTx4vYu
    BpVg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955915;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=36Gtei9+ICpPfGhUgPGYOlNssQ2PGoXOIDVUuqX1iYU=;
    b=oaEc/MpCqBsQEaleQgPhp6y9RFSUPw2Pql/aN7/Jm0p90XDy+N6pZVbfm0+10XSt4/
    HIUCePwxQNAquxz2S87seabbwBCTPbHrt0suipmpyxTVFKh9U07Qofpbkm3mk4hSG0/L
    dJt6MnJ8ZMaS/Xik+9Wm//vH/dWE9Vpt9kG3lezAJl8EkGyDWGmKhA7/x5XrnEqHhsAq
    WvUp1KzFe4MELi9sZTwip4lxyIevstIKWifcHLyYOy9Avlom73xZQrEAWO8ZCMIoTf3F
    fi/W1fR/Q/z385iQz9FxTB2LtbBq0mJs5gpdQgIYo+8kmcmVq6yDgQONvg9Wnl51QGfh
    mWlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792955915;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=36Gtei9+ICpPfGhUgPGYOlNssQ2PGoXOIDVUuqX1iYU=;
    b=Vb1FAuU0ICCAab32LMUJv+Fm3CfZns4X9dnrmAF43rPpkADgnX/QmtEiqOpi/xzY5R
    fgHe9M7y1F1u1KH8xeBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJIYzQq
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:18:34 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 3/4] clk: ingenic: jz4760-cgu: Adapt calc_m_n_od() to core framework changes
Date: Sun, 25 Oct 2026 20:18:26 +0100
Message-ID: <a718b428cff741a2c14fe3c022026c8a88c28abe.1792955907.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792955907.git.hns@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The common Ingenic CGU core framework was updated to support a
secondary post-VCO divider (OD1), which extended the signature of the
calc_m_n_od() callback.

Update the JZ4760 CGU driver implementation to accept the new pod1
argument, preventing compilation errors. The parameter remains unused
on this specific SoC architecture.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/clk/ingenic/jz4760-cgu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/jz4760-cgu.c b/drivers/clk/ingenic/jz4760-cgu.c
index 372fe4b079927..52cc5ce150048 100644
--- a/drivers/clk/ingenic/jz4760-cgu.c
+++ b/drivers/clk/ingenic/jz4760-cgu.c
@@ -56,7 +56,8 @@ static const u8 jz4760_cgu_pll_half_div_table[] = {
 static void
 jz4760_cgu_calc_m_n_od(const struct ingenic_cgu_pll_info *pll_info,
 		       unsigned long rate, unsigned long parent_rate,
-		       unsigned int *pm, unsigned int *pn, unsigned int *pod)
+		       unsigned int *pm, unsigned int *pn, unsigned int *pod,
+		       unsigned int *pod1)
 {
 	unsigned int m, n, od, m_max = (1 << pll_info->m_bits) - 1;
 
-- 
2.56.0

