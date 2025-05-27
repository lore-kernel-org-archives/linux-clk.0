Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DE4259C94
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345058; cv=none; b=m1h/radB/s+oRbbYjIuQjZOjSePz9i421eznmjRVGcmIXrgX+3MgLofd5iat0w4wmk3DoG1S4FlBtWsFkMrnwZafj8BlAgtaUQARb0LWp1r8uQEHdpEsdkxqvmLYKRw53JRRqvQu3kC+wA69UN6tG6TuKKnT1kJJfRu8LFmOmeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345058; c=relaxed/simple;
	bh=PcZ3HrcegfnXqs3zq2KhUtyO7SNQPGKEOh8eL3A9+lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBNvSVpSeVPvSAxMt94lt5Z8AAMgg9GzRj3DfVNVvcybFpTAkYZWF1tcKsZuIzYRYVsV6YeOJDegMPD4vbetDtAkIu50gRLNDegORVwvkWSbq0OBa4rQISiilVds+M7njll+iiHY1vwhIHhCibKRWF8HzOc4PcKdlOmQXqsAjW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M+Iei9aX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M+Iei9aX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-603fdd728ccso4663231a12.2
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345055; x=1748949855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDUY/udCFbCQ/CxzHCrSVeL89fSktFtkiZrjui4aduo=;
        b=M+Iei9aX+uPj/9YBtlwlzLDtUdKJgKpKQGWW5jWhq5Y+tNFOjLFDZJ+vTQOP/G09se
         I7vdHGsY8wEm2XFe5Erchvl1lL96HV7nBTjgbEMAfSvb6qhC7eJVVmqqwjQOT+oJAAWa
         ckongLEym4348QLaeyfgNUQaifMXNLNfcY09IniINPk85QJxh4HkvrQqxvuc9WOFq5Re
         N3mtmvSsmdHH8slxgmihNQQQzpb+ein65MC5DcIwC4zHoaCrx/OCoGnKNMNcBAFtsLjA
         7zqfCHcB7CEqjW/vpuzbi18EiQ+aufhz0UHmd9Kyplmoq+Y+tRQyVM3NlURTe8YEa9+O
         I73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345055; x=1748949855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDUY/udCFbCQ/CxzHCrSVeL89fSktFtkiZrjui4aduo=;
        b=cdApq8VJT+8cDPzI6YDNLKYi6PMuY8UM+h4C8Lo/PdgAjC0fdbvVgNfu9Kyfwv0HXs
         fPv4POqzSCEBgsrI9y8BzveiTkG3fqhoi3ELVuJqo+mPTOqL8NSvIu18QrB/zxeF+8K8
         +EP7npkWH34EdbvplBPAwOAZd6PTXuQirYzKLV2WCanqJGmbLH5QJTgKiWRj9urtKvys
         l+RSztNQ4yKwll7ph95N/jWuCuMWWecklKPA5owS9fyW0HBUyRe7CkPsAEzPukTADAEj
         9kd034+pl5fOzCsDEQaAL0haaUt5gzYqZrXM8kZVtZUIl/CJ2aC06a0Kooovg18QAvEp
         za6g==
X-Forwarded-Encrypted: i=1; AJvYcCVqtvJKL/a183irtHl1C5Ynz3l+dnJQ5VJrKnllQeIY+qYViKdoq81DKXJ4HFDPEdGaEvoO9t+QAww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxabJOVOPdfCKxMpCzptWXPKmNRk6GazfrIUa9bJc0e2HiFRWzn
	8XtVUuBYWR7+k5zJkBSx2F165W984NT4H/nP/I46nlGW9JnNjerReUQn4AMvq2kyHuE=
X-Gm-Gg: ASbGncsu3kJ5swOBJu6un+Z3DI3duOleYxS/2JfbA3cWp0sG0WOa2LntCKsuKuxZf8C
	PB47MugOMun0sdugOim8NSiXWnHsGjvwNJXCJHNiYe++uZ9eVMcONtnu581nGEmN9ugH68oScOu
	jJLahrBBo7UjmTATbsPx2Ea9E7w2iT9mvaA6qaO7IaoxuCTK9MoUrT++ze9VXBfTi6c1CPtlodH
	l8Btqb+YgEIUQVLHRPDd09N23XaGcKjldLPLlVLXNke+A47uB6JfZEStBuQKWL0zRJplT4WpZXs
	bXwBipAy7VyIX4jeNvaaw2Hazkkvi6kmpZPqmIYvqNgJEuJ/3JJJPCGVM99SeFY5r0zBhaFbXA0
	RKAbJ
X-Google-Smtp-Source: AGHT+IEapw+oDUNYJWzRpbqivOuZHluFTkHfFwaB2YzuwZtTgF3IVbvJeRzozPCVZmCAbTiyVocwyQ==
X-Received: by 2002:a17:907:3e9b:b0:ad2:2d60:24a1 with SMTP id a640c23a62f3a-ad85b130284mr1127859866b.11.1748345055154;
        Tue, 27 May 2025 04:24:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 2/8] clk: renesas: rzg2l-cpg: Move pointers after hw member
Date: Tue, 27 May 2025 14:23:57 +0300
Message-ID: <20250527112403.1254122-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reorder the pointer members in struct mstp_clock so they appear immediately
after the hw member. This helps avoid potential padding and eliminates the
need for any calculations in the to_mod_clock() macro. As struct clk_hw
currently contains only pointers, placing it first also avoids padding.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- moved pointers after hw member
- updated the patch title and description to reflect the new approach
- collected tags

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c87ad5a972b7..767da288b0f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1185,19 +1185,19 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  * struct mstp_clock - MSTP gating clock
  *
  * @hw: handle between common and hardware-specific interfaces
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
  * @off: register offset
  * @bit: ON/MON bit
  * @enabled: soft state of the clock, if it is coupled with another clock
- * @priv: CPG/MSTP private data
- * @sibling: pointer to the other coupled clock
  */
 struct mstp_clock {
 	struct clk_hw hw;
+	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *sibling;
 	u16 off;
 	u8 bit;
 	bool enabled;
-	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
-- 
2.43.0

