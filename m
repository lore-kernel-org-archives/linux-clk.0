Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501224;
	b=WA2b+qVqLAVN9hqmNhIgcNK5UKoLfjM4Sxw8UA3hpGWbJuplJRXzEFDiuOTN3NnzSqxk
	 BMGSxOvD7FhqC/OMiya7WBECPvjVtvZRNbXuVlOMqXr8hyo7i0ZOzjmQh/eGrPzcOTUeQ
	 1lAgjpJuIYMTvrKjONdvSQe2Bba/vVL7MAK9WtKDF2sGRY7qeRK+qtnOqDLDaasJUvIRR
	 KHogBhtcbTNMfKCksz060zJ3kcNkN3btNcl7MiIYUf4nQ6frdr2U5UeVjNwV52WtmCK1F
	 BX9jkFtgyiJ12GEQLG/8qsvcv4Kgq0gAJg5FeySLwEVraicIWMbyc/TMaEpN52HU4ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
	b=ZCZHkGzaBOuerYgCItaH5JKrw9Den8F08ImcLFpeIU1AukQ3ZMAHVkfrebWgihz4kk5r
	 +wKswEia+vpHmEwFLsDUosZ84dpL77DodHht2mOWOLB7gTJRLv9o5YsZDO2bQc914+KsO
	 W4HPQnet0fb3i/RvySg+imxp2wjki+1sTsT4opI1ZT9xpEgJyRd5xhSK6Q4Fi9fRfkTkn
	 oB3x7F8dd8886gd1thQwPR9h4+QnElmOz+LoyEReWKSfgWe8xJnrCTWSVUNcfG6RspQKO
	 wTQewtpe1SJ6ne6Q4oBRzIGm8f4HirYo7AWQt9zrf7F4w7FRyRcXRvrJR7oCcY3CRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0F7Hu65;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5904B60A3813
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 13:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5904B60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0F7Hu65
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so17354405e9.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501223; x=1793106023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
        b=E0F7Hu65seHwVdW+FHp3mVrOVZw/FQgWjo23wNhERvnPDPX5w0fuyS9y/+K/1or6AC
         53UmLLzuXH0GmfEXR0ypuB/t1gOwLzBNFXykNEDkIOlFHgYRlyo2RTqsVEFbUEkAqB7F
         CYjn96br5Iz8K+Wh5YFmSKXZRx+8iEZM7Ix/7zGuz4Sgiyt0Y7EJcYfXE4YF5xLNjbMQ
         zB0jun/WZ8oqFSMDS08LmBk8HmP1Ic8HNig6WgKSs4azQdbVwst7UOv9UzQuc4EenfN/
         2OdjzcTCiwtJBA7qncngxvdJ9kA65aWs+JxwYIH5btwWy8w7w4peSoTcfgnL/Lfb7Z/6
         X5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501223; x=1793106023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
        b=U/1MN9Ao7j3jDPIzdc5+D9O2+9b342MYpEAZA/xLW4SSoQR4wWksQ/+hs4Wxv+ldbt
         jbFgXdqzq0LJPE2zq90cwyUg1MKqCy/VuQ6hTbVknxcx/0lG/yVovEwj/6VpECkr0RNW
         mHltu3ScRyRXxGUdClncgTlQKA5IIoUlQKgJ3iLvjob1sm7wZSQfOrjNRnt8djM5RE6u
         xO3MEFq5KZ0KP/2lRatnhNmM/u7SAapH51dMmB81t3Mb3t94Wf+PYLR4readjlshF0pm
         0s/AoSML5/qudVSEQ4RYdGnQdxx2QZOSK6aDv8teJljUscoUujUvd32v4a8VR7uyjoNr
         qW5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuNBQ4twYcFODV7vQtgJXkTW5ZFT3XMxpLJ/RQ7DZ0BT3gWpVVQe0peElVTypbtR5TCjKDtJl9fLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOzPjsBaABVe2XEJMM+gneJTsyZrYb1U9Ty0omeesx5+Hx7+qQ
	F52N5YN1i6EP8j5MUyRl+6ywrS5ueeAyfBzpgghQhpBc2u4aT8winYme
X-Gm-Gg: AYBFou2kvZ9kPrXPuNpG7n/lD2wCqwcxJp0Sc4v4lCxs6pP+ie/Y4Ze76OrZtDeq2vs
	SgG9vA2E3ma83hH4bcvbsiE1s5XeBauAACo+W9Roaldz4ZLk5VlKSyiG55lFynfQngFlJfOaMV7
	uTbOYRnS8I54hL7ASCHq2K/IrEMZ/gtmczy9N11gZrZWUjgU+SxAV6RU5oZLEJ/gEHUoP0ZugqW
	uj5hOrL7uEVjND4W2MGmQitLoY9AHbipdYkewKvSjbmuveALkAozPwy35Fe7Al7vtq4vKUhhr1E
	epYet5F8Xz5JwXNYhQsP7E8cyEQc3esVUyXFYBsfphHFr1K3QiwLl9KcqhOFG1+GbBYQe+hzN0T
	sQ9099iPTFJLCvVhUsk9KADR85eyjktVugmUTbLdApKZt8Wyl0AzQsR1KGYj7BZPn20klKYBS0W
	zqWTNfxOepEdjni7C2veaj7VMLxMh6H+r30f5W5tvWasx+4H7sjSOlFM2ETity7wiXfg6GJh6iD
	BJgw8j/rux3NYLk1Q9m5RZSeqgMW1NuT6KO22zqL/QsaRN1pFYKbeJ+yVN1nHtHw3zFFNx/ew==
X-Received: by 2002:a05:600c:608e:b0:4a1:e08e:46b5 with SMTP id 5b1f17b1804b1-4a1e08e4871mr164567895e9.16.1792501222390;
        Tue, 20 Oct 2026 06:00:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:21 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:14 +0200
Subject: [PATCH v3 3/8] of: property: fw_devlink: Report unsupported
 supplier linking
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-3-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

OF supplier linking is deliberately disabled on OLPC and Intel CE4100
systems. The add_links operation currently returns zero on these systems,
so callers cannot distinguish unsupported linking from success.

Return -EOPNOTSUPP when supplier linking is unsupported. This allows OF
unit tests to skip link assertions on these systems without exposing the
private platform-support predicate.

The driver core ignores the add_links return value and marks the fwnode
as processed regardless, so its link creation and retry behavior remain
unchanged.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index aa65976739e1..99381c07848d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1708,7 +1708,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 	struct device_node *con_np = to_of_node(fwnode);
 
 	if (!of_is_fwnode_add_links_supported())
-		return 0;
+		return -EOPNOTSUPP;
 
 	if (!con_np)
 		return -EINVAL;

-- 
2.43.0

