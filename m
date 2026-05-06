Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84744258EF9
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028662; cv=none; b=fdP++xVXXF13D3dVXzSKmoVreDiCUj25wtP8VWYrdPxiFj/EtkZ4HrLP8GDzc9POARCiztiP6NX37sYm22Mp6iIlwwfAmtaY7k6G7wikBvKRvkXlnaWVY4ui7iQJKKEBOarZlLkIPe4oKEf1rOceTC671sDP33wt/MjkPywPnBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028662; c=relaxed/simple;
	bh=uUN1TpCq5A1biDW7SQgzXIgDhMit0DTFvaH+q74KNes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5SSaVRbQno8811MGaTqKAvWaREIHmSTK4JJKUqEeIKSlX01Clo2cQzUlVqMK3fdNaYu5fNgLaO4PlH/NaHxe4tYzqmUZoeA1NbmnQm1i2GJ8ulbVktSkH9APoYqeiqWeCJFHn6CrsXp/u7gDpKgA2nL5NAnnfcshDlmumuapR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ft+oUSbF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UybTGOyM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ft+oUSbF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UybTGOyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1NS3MB4nA8GhCODr9+c9hyS+UbNOcqm6SUmib9q3KY=;
	b=ft+oUSbFw2rIKTA2uAkuceVwYJPON7tQAHBggaCPF1z1upSCXXYu/AgwS1YnR89ubgloAp
	KuJqoQJBcKIr3/UlcxB+1g30SEvlrvmqb4f4/GG9p2fhGwH/aISbntCBk0CzJqvoBWUydV
	F4Ls2y2B/CWD5+vGo7RXDF8jr3JETzI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-3Grh8FbuN7-YnTRK2oDexw-1; Tue, 05 May 2026 20:50:53 -0400
X-MC-Unique: 3Grh8FbuN7-YnTRK2oDexw-1
X-Mimecast-MFC-AGG-ID: 3Grh8FbuN7-YnTRK2oDexw_1778028653
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8f4ef450191so1226652885a.2
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028653; x=1778633453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1NS3MB4nA8GhCODr9+c9hyS+UbNOcqm6SUmib9q3KY=;
        b=UybTGOyMj/2uLiHbVI20d8s0kZaGWjjl9K8ToG2BBUbwjgnUSK25+yTCngy1lK/Si0
         TSLvW1Aj0TBWt9foMN1bm71ysjhwdCm4dDBxGkI8ZvbC4fkhr8H/i8G6RZcrG3uhv8mU
         OEHL3rFluN5xeV1VphjcBroi4ckQMNHdeOnNyn6SIazWdO/t0L551lYR1WT6N8OytzHP
         nFtY97bkKA5WPnEZdy536r8m36Ud7gtRYApD3c1VEI3d913u+Ya5bqqL656ukyP6xDhb
         Pt26BPtqRLYRrmH8K7oNjIhNPJb+nR1JH4cyJ9BA/vWqBMK4bBHXWDOCaD6ACQO+DctC
         VlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028653; x=1778633453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1NS3MB4nA8GhCODr9+c9hyS+UbNOcqm6SUmib9q3KY=;
        b=g1lN//fizPnLtb8KG6WrJuEUyrIRpm8C87zDofrQLsaHjCHV/p+lsGxDMeXdGDfcr5
         E7dd/iBfvOBfN4kNEM5AnMzdbhytTKLwSC1sScG52z/C72pgIC+rXPfoeUcxZk7H+BPf
         YxAHpiLAXoSTw9ufiTSxKSJEZbMTDmys5R5Eml5ydO81Puy4svmN2SDpNlTiBzXzuF46
         qMH52/40BunMpxZ3Q/vG3OiPWCdYiucbhsIhQux9xEHLFVhXAGN5JZDsp0d7r4hvEW/8
         89PWMO8yg+ERtYhsNL/hq9CkKbEjGWDADBtwzhijnlTQPLpkLNydxSjiDHGp4wzh/ky8
         j2NA==
X-Gm-Message-State: AOJu0YyPUi5JaVPbAKbFeHdwN3sCNWHDFzEmuB072a3JeY6GJz5gwowC
	NCZnf0SFpdpFURjkjg4pAzIOENi0GMkHHsWL0vc/C5ktMEXDqSB+mhf/gWEcD8hivUMtVw5QQtq
	eTzW2ysazKjSXjz7LOoulUmLioW2xH8QQ+G0zZUxexe3L6kfEvJQWcGar5ab0kQn1f3SQ4kCNwD
	XrfMovmlAqLcts6oY8kL+iaiYjyizrAMr6kp8oIlEwuxi/
X-Gm-Gg: AeBDieuW4szjaHOAyK7KZNZ3/zZcRWFHKcOmo+SL2Quq9QW1s5Qb02EzQoY5MleTpW0
	/Zc2ACXLTPXm2bJjpxe6SFfdqaajNRGmQ76YaUTw8JQC4WIXeC921s3Le9sdxmI6GSWHPIArbjQ
	hdIFioWDPDFttnwCUCFjiyMIDbkZg+jFGBkOl/DDdaZD6fTvAGaTsyliqEaPTc7msMc+P15kwPA
	qGlNYVjmuAM2ZytSmPPMUvkAnsvVmXCxBgxlM3lvMv6DZMz8knTLUA0UH0FEOxaaXlxELbdU3sn
	BKxW9G+UVijAJD5HrISj7N6QMTzf8AUf9i0NLlYHld85aGt0MT2aZWRFZMHo3KM2Yse1aMkTaad
	EMNEt1CiAUZXUNXexTd+AEvuq/OjwVj9c5wFTDhQWdzDOg/g6VcB2SUjQOAqe5N1Hn6SmQKsv
X-Received: by 2002:a05:620a:1a19:b0:8e4:ebbb:b162 with SMTP id af79cd13be357-904d3eac012mr213947985a.9.1778028653026;
        Tue, 05 May 2026 17:50:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:8e4:ebbb:b162 with SMTP id af79cd13be357-904d3eac012mr213944785a.9.1778028652575;
        Tue, 05 May 2026 17:50:52 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:07 -0400
Subject: [PATCH v3 11/15] clk: scpi: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-11-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uUN1TpCq5A1biDW7SQgzXIgDhMit0DTFvaH+q74KNes=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfC5ocugJFak4SEcpDV3dvLfRGGpIu3MTFEVqeJSh
 akmFy50lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJH+uYwMHwyW3E489X77H/ne
 hbXsFi63otiCTsoUrXPOEE7VCp5TwfBPT26bDlto571A73XFyXvmZoiofOlws9J2ncPJ/N+x4DM
 PAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd0d5..650c85aa0328 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -32,18 +32,6 @@ static unsigned long scpi_clk_recalc_rate(struct clk_hw *hw,
 	return clk->scpi_ops->clk_get_val(clk->id);
 }
 
-static int scpi_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. scpi_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
-	 * running at then.
-	 */
-	return 0;
-}
-
 static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -54,7 +42,7 @@ static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops scpi_clk_ops = {
 	.recalc_rate = scpi_clk_recalc_rate,
-	.determine_rate = scpi_clk_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = scpi_clk_set_rate,
 };
 

-- 
2.54.0

