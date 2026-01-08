Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0113396E6
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907096; cv=none; b=Bo1FpQyDKHIz97wkPqSPMxQARw3VJhvU/Aoh1MskvpfPSelGwAzMjCeGDMe0HIORf7EaHR/dPWbwRWUOzXakY5F1/VqXCATjbzYlTyPtZFa5fn/34LffTuw6rXTIbJok7559eloIRRRzBR6MxluSw2+y2f9rmmAqy1eJNln/9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907096; c=relaxed/simple;
	bh=ScZkcyRUl2Y7Rb30HqkG8nPcPdnar+WJX8LbQ/gUKqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bbyz6n1eJ1djq01TY6gwMGN0zN7QraAd98qc9q8Q9tqxif6EeyhlwCbs6TjzSaK80FRK0voHrTcJwMh0RZFe7JTz94eXeA3ma8mIm1Jht4XCJsDefbGw4kBO7KpOtDNhyCQ3lhw23/XZXj4UWLpHd7FGq9qAQIxIOoSVVYnL4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YnghNxTA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K+bUT0NQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YnghNxTA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K+bUT0NQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr9znpRqAwXoXpH6toRVbeWwS5EY58tJLVv5ADu2gnQ=;
	b=YnghNxTAkLVDNTdan96gksVUuyr8bakCZqtOhMlmDHZPxjCP9nVxOy0HB0HlQRWPjrbDTf
	vDRil9CNkS2olE/EfGErwV17VwN+8ticV2ONYQGo/iQ3Ai1vKd/zlu1Uyspo4CPhjqpVkI
	iJNSvzNl+2034IjBNAY0PA0sGJBavI0=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Bq23i-4zPdCV87nZWG2qNQ-1; Thu, 08 Jan 2026 16:18:09 -0500
X-MC-Unique: Bq23i-4zPdCV87nZWG2qNQ-1
X-Mimecast-MFC-AGG-ID: Bq23i-4zPdCV87nZWG2qNQ_1767907089
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ecbeae449cso4416339137.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907089; x=1768511889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hr9znpRqAwXoXpH6toRVbeWwS5EY58tJLVv5ADu2gnQ=;
        b=K+bUT0NQKPuPPoofT6FlivjG3K1nxYDLAL1tRB0ZzSvu4veSM7+w3n7iKvxVsWSPSg
         4EJpYEwIxEt5etAg9e0pIkvfrvakseE6kzdgnwNSNRC611OQ5c81dLtZ6t9FwZ6uTj6d
         Bu29WGbqlgPk+RF01iAvhOAv5Uyo3hsPN4cfMnTEYg9+dmwB2RhIfnZgABErYMZE+chd
         3VB4kd+9TJ8UZOMJf9md7xYRK9G7u3TPGaoTL16Kyfb8V6mzj7xPphSp1TuOG/WS8ii6
         ORXvHqDeAE12dCBB+ah6FHoorqt1vlIpQY/JeBqO+R5lz7gGqlArn130MeLXs1ha9NE5
         M5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907089; x=1768511889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hr9znpRqAwXoXpH6toRVbeWwS5EY58tJLVv5ADu2gnQ=;
        b=Exh/DOMRdXOamzUCdQzTc6+netN84r2soUKwrdTOxxBmiab2c7phgqyiB/woABzHoZ
         F7pI/JrqaRKuAepINjym3gJ944b8B31257FfGZU1HWuxYsteV7WyHwg3gTeO3lfYSEO3
         w0XnFStEWQix+ZwE3aar0pw/+Z2BRLQZEMMoyf8TL2/DYgd0JxrtcDpa6tuRP567Yduu
         N4yh99jIvg4rfDKJmZWJm5N4kDmEQEW2gB7r0gFOBo2ALMs8YynOYWnwGycYSMYuR3vf
         Gzb+E6d4Jv56my3MT/T3opR+/3TwjD88SSjcMCsaDI1qcUlViGt5OrCp1GisYsUd9CeJ
         joAA==
X-Gm-Message-State: AOJu0Ywr2YxqEtDMJyKpI4m2qLy23dxn8mRLlTaNUmQvs4Fvu0ZjXdQ2
	aYwOTY/fhFApTw9iF+q2689fNpUAYKK1vGVwWml7b2+1ozizS+fFNuEOXIQWZIsZtP0Dk614tKf
	AZwlLMyXncSb19mJ4vewEQi1l6j6r+UWk/VOJuuQbY3kQbPfWvkJSMnVeZeWiDw==
X-Gm-Gg: AY/fxX5grwLJ9YJSGk49+36iN2TmeNcCWgllEB9fB+tHcZ1fN5HHD1jMQlY9CKa+Z8z
	8FMUM7RwvsG0IUdcuRvG06ezdmMZzYI5v8KqQsKOR02Ug2fT/RE5DWQNZi37aK2zkj2UuZ/O74c
	nIK4t2sY0LyyUmEkUYkPswF8CNI/eANTfj60rMQHn/JeFsm23qaQsiYAv74aurV7ADWZQRjXgnG
	nSMSTBDZkPI3Kt1T4erOg9q7Jh7gtcEBd3EJICftYe4ER88gcEUbqlrLZT11MMTPKfO178bru+S
	rIv95jHJsZz3U9Hsuc25/VNxUXLahgzEbm9DzXgTBYNLi4ApVYBDuumL7lB/lnEPTVextlWuuUv
	x61Omk0l4EPf5tZ0=
X-Received: by 2002:a05:6102:3e1b:b0:5df:c33d:6e3f with SMTP id ada2fe7eead31-5ecb1eae0c9mr3157003137.13.1767907088903;
        Thu, 08 Jan 2026 13:18:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrFEWux3oAL8sPgl8CrCD/X6cmoXF0fYkFPC+I12DUKPNl0o48fSIl672itmPsVsuxbfr0jg==
X-Received: by 2002:a05:6102:3e1b:b0:5df:c33d:6e3f with SMTP id ada2fe7eead31-5ecb1eae0c9mr3156987137.13.1767907088454;
        Thu, 08 Jan 2026 13:18:08 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:07 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:30 -0500
Subject: [PATCH 12/27] clk: nuvoton: ma35d1-divider: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-12-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ScZkcyRUl2Y7Rb30HqkG8nPcPdnar+WJX8LbQ/gUKqg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Lbf3OB6+cyD27nlncs8X1045u/rkfl/Sq8S958n6
 9dW2eUd7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiz6IY/he0Ke4yieY9asQd
 yLzgsuDcEoHf86+7hV3sP271e3Ob7F5Ght6Fa3cL1+ja33fKlyjTm1qfeim7xSU/c2ngzT4h5+O
 3eAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 215f8aa095a1 ("clk: nuvoton: ma35d1-divider: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Jacky Huang <ychuang3@nuvoton.com>
To: Shan-Chun Hung <schung@nuvoton.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e39f53d5bf4578c628d34b05233c8e8da317c4d4..e992e7c30341977bd4baaad8b24e17039252f90c 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -44,11 +44,8 @@ static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
 {
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       dclk->table, dclk->width,
-				       CLK_DIVIDER_ROUND_CLOSEST);
-
-	return 0;
+	return divider_determine_rate(hw, req, dclk->table, dclk->width,
+				      CLK_DIVIDER_ROUND_CLOSEST);
 }
 
 static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)

-- 
2.52.0

