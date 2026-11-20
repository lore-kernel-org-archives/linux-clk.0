Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173106;
	b=AKwD6/8DqQRfe+r7LnfuSGNerlqRXI99WYjTur2O68kgsl/imtRRweFES8yK0517gBCF
	 7Mmt6RstDCg0scgZyaD0bCcsNr1UamYsbM4T3/GtCe6cdP4K6xkNj67UOX/YYooOW/YXs
	 EEjKb4bDWu5884mhlKrq9FNtjcLEJ0Ghqp7+/LykTt7p7/NHe9npi7askpsEG8S+FNOkF
	 BJ9Ll3J3PGk6EpzbhKKgSDU4G3mrPF8bkxV+uqJL9BPmIPFSLGIobjWFoIF/FlooVrSA8
	 siHgnJpRAvqCL315T7SPhLrjOKwZhpBWnJ4J7HzylzI5rYKo3c5fqn6azqGz/A0a3xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=;
	b=BYsPHWBw1WrBtWaWGmZ7yvw4P1aug+UaRFdM6ShRYEPd1gUXzN9Oskomys4FciWPKxhU
	 ZNQOtgT4Skbrik36N4OujGUbHro2RXtvhqow6Ve35VShVGs/11QzNnLVV6kBlKKCVaiTS
	 cK9inPChiN8rWXmcCCHNHXFYil24I/WZhjcEE0HrOmFpG3qr/j6/P5xVT/X6MbyUaeRLr
	 JLki5m5RS2AKgp0qVfZ7ILS4U6FCr+1ICmDB4e5ojLrcrWRueLsDy36Xt90W++Qq9zNf2
	 Crqn72k5kyhX1lmy7T1xxgnBVFdgvk6+mExywEPfajwUZdQVWaQmlIVXyorKhT0Z6KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="GZQq/cEt";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575560A5BEB
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 11:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B575560A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GZQq/cEt
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505186727fso128913366b.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173103; x=1795777903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=;
        b=GZQq/cEtev/0cEWKsNXatPIT/tRjudKPqQnK6U72i3uJM4xJq12cqJReD19y07hnMF
         xyGJA2pu+tO3Dm/+kwARwVha7RvZGVvHoz+g5Zun2hnEFuT4oTOF7A+/rlR6eJCUuuri
         B4FnRrFFS2CvScIr5ePtGnAC35qmrYECGE9yL9Z0k2QLnbgaGR+d68qSmsgSconGq/S5
         qVwamEKtHTu+gY2TRjzqRH6SQYsS7eSwQ+WVAo6IlPE+kasd4e9g26bRTadxh6JTXeZG
         +q/i5kPvfzxJh493EGT4qtogRS05LeD6Dr6teYz07mtVx7Lzq6XamJn4fdwY1Q0sRckG
         lJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173103; x=1795777903;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzrGkvF2rBzn/M48OtU+sHRDeBPCOoUsXp1yXuY+Nm4=;
        b=isU8NzeCoCfETIw9XSPJnViIQgKm02wri4NZpwrY04tmei3OGE92POKtvnNZ8qNnLW
         l0Fpsk+bjmI4dH0dTUPZxJXnYl3H6roFgaP9h8vGadwtNWUKdtG26mkLhAjsQ3witHka
         XdSmogxA4CEiNycW9Dh67AKOqgSxZkNRCeImPOvGNbxQ6dVd7YYWdR9ukNWso3i+Nh1Q
         D5IDgaXnaGhQ+bw3ASR5mAbI8mEVyXySgKA3B55du6ZDsMSmhUDSYhSY8Ruw9NtI2aq7
         an81VOqxyDBhbQpaVBQjVRPaFHvXKK4xqd/VnuEGlsEuy6SWoTW994lVrW3YlPQ209ug
         2pFA==
X-Forwarded-Encrypted: i=1; AL+hErH0wTt2mDXUHVNEmuLQwNS2b2qLAQm1f6dsIlv0iNac/D69372qmjnWHqF7x2gkMTf/GAMG+GT0wfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S+T8wVzfXUL+rganbkx+5vENT9urYJqXknViltGAJzhrcKJNK
	XkJyLLt7Yoxif851NqPvxGcOnxTN1RJEhh2OnltJP81mpJtx0C/j1OSKkeju23lq6eE=
X-Gm-Gg: AYBFou3BZtCuHBKLqK+D51A8ufJlTnLaUarr2RNMucg2WfSqMHBauhWQpsyDLh0zFTN
	y5TwmQfQYHdmJzKpuiEqLZOC2NAqZ2JXwytK8W/XfPC7+bgP0o9qQ0knH5JcCpQDzu3rKjm/FVq
	QZQw0OUg4phi2lHnZ/yQhyeOvepchJrBuAAWCnlqhEC/3rE9oIC+UZomuSlas6AHGdV+abn/NzI
	nMB5UtxYiRtf1ACeP7NBtZ1eG13uX9jRrHIqHS65tFJmlkH+ARMq5j46Kolewr1ehgNXhsVh5so
	vXR8JCjsHLvNRhS1/dV70nvdm3y/PUpGFMz28IGu4U5jPgP70qo4LgrkhPpKa6Nn1HthhzNkeHb
	ZVtiNi2xJoaf4gaOwxSOTk2VooCXzdW+H3MY3w+NWpehhCLgOWok4Pq/yEMteBOM9d7k3wrfepq
	JCbZdbV8SeHPA8AVe30cOfPkOHbW0vboWS0WyqrBzyWR6cjQbot+Hd0eWHey47rITVapMaU7dsh
	F4MaJ9CIRuxE8SS/fQn7JhSFGUr+Wy08aRcHa0gB38pNQyn+mR8i9Vv793mL3aPtDC4wPE+8syY
	20a0jOIBwzHG3Xu69tmVdRbzS+YClRAAfhjp6r6eF5Fbfb4e5BJW8Bo1SubfCQufMHobuVuztje
	sy325YYaJsh5qX9OCnWr0Gg4cMs9FHM+n6xVL/Q==
X-Received: by 2002:a17:907:6ea9:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c513a3a656cmr295368666b.5.1795173103212;
        Fri, 20 Nov 2026 03:11:43 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf61ddsm4595920f8f.12.2026.11.20.03.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:42 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/10] clk: imx: scu: Allow untainted use of driver_override
Date: Fri, 20 Nov 2026 12:11:08 +0100
Message-ID:  <ddc76beb6482214e115d8ab205056456924c5db3.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=jgaYqFkp6U+MJCxcDBbdbssya7kT8plptxESbnjDSnY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACrYXpZia37r5qPKPkOrurPKrb8qglkFq6zaI hJ6qIxGohCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAq2AAKCRCPgPtYfRL+ TkoCCACdj0BNZECS1Bkcr2YYSsgLgLNmeGbEzHiUikzoyjSPUo+CaGzWVCCIET0XINWo9+3waXU PSQpRPKpDtKhIld4oJWXugSRyfxjuz1E43RBa7QiYEYbyNy9LlMIsBccnnHXDPn71inefjcuwEA W4ud3FTp9OkvqEDwnW9c7nB4ghuyBDxk22UkGM0l+4qOyp9Z8WHOmFkO5hMt6GkyBnzfNzuTDZC 72tn4Kbk7FcuJMIEKaVxAuGdCpUaCAOhQ/1aRAYdp0fM3IOXQEspsJ24o/Wyg3SPgSM0I9Ek4lP CI0G3MZ6IYzhgWq5ed0ZyQb7gf3EgesBp/kPF5U4A+pSFKw/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver makes use of device_set_driver_override and so should be
allowed to match via that driver_override. Note that the .probe()
function assumes that platform_data is set for the device to bind, so it
can very likely allow root to oops the kernel. This is not a regression
however.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clk/imx/clk-scu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 0d034e206c6b..7622890d1124 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -626,6 +626,7 @@ static struct platform_driver imx_clk_scu_driver = {
 		.name = "imx-scu-clk",
 		.suppress_bind_attrs = true,
 		.pm = &imx_clk_scu_pm_ops,
+		.support_driver_override = true,
 	},
 	.probe = imx_clk_scu_probe,
 };
-- 
2.56.0.rc1

