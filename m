Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C6E288CA3
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756466708; cv=none; b=PhBigWPTla6+wzgpEmJOTnxn1A3bZdLR2sLIplvYvNcnnFlEt95dFMGbC+aj40ccQhw0aVcnOxiuy63SWzIDRCs3/AadDNfRysgwkADlFLUt1Uc6h1GRrIt+sKC3PeTWlyiI7SuE+Vghhve49gh4HO9icYnYgKyiAD4SEdoWkxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756466708; c=relaxed/simple;
	bh=6BFQxgM0oh5DVS5xIr9d7exSQK21yLoo9WBRstJGdHI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=q5z6P6WR/3Nmmgn14Kl7rxgQ6xLQVINERj9F6JaKlrdMZ2qnldA1nKRztK/GBGGNT16zdawtWOWqm+WfzuvMlZTsewSCI++U4+8X3L2Fsyui2FwZYoEnLi9ll6SmcfdPcHwqo26jr8uQSWOELCosB/sTyUjfdQC0LK/Xe9vQDnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FkNPPWmd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FkNPPWmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756466706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=H5DSrH7S/YL0DhZrQaaJj+H/G5K8+6JE30rwyPkkkH8=;
	b=FkNPPWmdZBAryhAHtAJGGETQ6DJiUG+mBKliriIvEvdgzQtOtYA+ghg1JiOS0bZNi2+9wO
	p0H4XilmEwS+e87IWQrz2phJwHtHgk3DhtDNGKyp29+eKU6tlbKg2mntd4o5e/tj5BDw/M
	sNBWREqB8guG9ujrzkCjGMwWzwVZj2I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-WHbU2cmUMm6U0r3Sfz8k9w-1; Fri, 29 Aug 2025 07:25:04 -0400
X-MC-Unique: WHbU2cmUMm6U0r3Sfz8k9w-1
X-Mimecast-MFC-AGG-ID: WHbU2cmUMm6U0r3Sfz8k9w_1756466703
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-afcb7a3a160so182991966b.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 04:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756466703; x=1757071503;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5DSrH7S/YL0DhZrQaaJj+H/G5K8+6JE30rwyPkkkH8=;
        b=TIMdJi1RwUyFW/EiZjF4+zTcju6XShzqdVYjzoyZ8dppILweO6WQuPVmGbGbBn4DuK
         /VP56OJL6R/L6fJnedWO1Rvarbb/Nc+Vbr6ZfsADE/VwZ3rLvp/Q4nvdGFJCoPNXh4vw
         /qkDP69wSukC0KeNwXdNQizxSkaCoZT8jdG0wEurHQBcXlKVbhyT3x2/rj5jz5rXg0M2
         9pWB8HjZm2OIoUvvH7bYX+QH77z2DhNGJ3Dd3SoZ6xFphHd8eGUVGopKXlyGakiLylQ5
         R1NxCq4xOvOadNgJIOtffdIyI9kH00uo+xyrbav4QEHbMh4gMHxXIz0V57XyVTxTEgBT
         MnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/zL9M8wRKvsrm0LkPsJxNAxJ09M3/LWL+vCl+RRcBbIIWSfGZ/RtYY36uuRRW6EuLYqaCka0IiIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaVtMEsO+IijYvWz0zmkXAWVqla35YQ+vP2Qnba2joZBSufZUs
	vb8T5Rrcyov15C6U7B2IzWhXSKYfHu5oW71IGXKMNpTN1goWg3B/aAiblps8rX51kbpgKoQDAwg
	tbc7TU/zyXFC4qpdqEsv18LmPjaJaJzgfgFNt5NvLIpu9VRauj23G+Q810pMmpkLR+xvX2Z9cbj
	mjjV0VIl7IprApxJrWmgRTQet0Ln5nqtNsRqCE
X-Gm-Gg: ASbGnctRaP00ZyrigKCROSXKUcVjiYCM2vIK5ADuKo5/1u2c+OKVylBsB8qdOEnKwvR
	+KBzCXMrifeW47pWoFhc2z6KfaOrD2bxiH1Qaw2RLswPphVloOGyefNr2eeiF2Xb1rW2WwqCKTm
	68rthimtDG6bbInhh8uRVWBI1QOAFPQb3WaRx0SlcIRpUINqAkzSjR
X-Received: by 2002:a17:907:7248:b0:afe:839e:d10 with SMTP id a640c23a62f3a-afe839e3cecmr1780883266b.31.1756466703353;
        Fri, 29 Aug 2025 04:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDUAydazSnnhFhQ2IS/7xxn5zNZxC7KkqkPr1qBMJMM9fvjQWnwmefjaIofovb26bMZHJC4dwIv5EeZ0pSjP0=
X-Received: by 2002:a17:907:7248:b0:afe:839e:d10 with SMTP id
 a640c23a62f3a-afe839e3cecmr1780881266b.31.1756466702991; Fri, 29 Aug 2025
 04:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 29 Aug 2025 07:24:51 -0400
X-Gm-Features: Ac12FXyyk3VCSqAncN0P6PmazJ4uiOf2K-91_nf2hLatGLxa_FrGw2-c_4CbC0k
Message-ID: <CABx5tqJ0+1bjoMM4qPS94coa0wyQaae1gJP14pUKk+xVgD5kaQ@mail.gmail.com>
Subject: Bouncing email for Renesas Versaclock 7 Clock Driver maintainer
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

The MAINTAINERS file has the following entry and Alex's email address bounces.

RENESAS VERSACLOCK 7 CLOCK DRIVER
M:     Alex Helms <alexander.helms.jy@renesas.com>
S:     Maintained
F:     Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
F:     drivers/clk/clk-versaclock7.c

Should this driver, along with clk-versaclock3.c and clk-versaclock5.c
be moved under the drivers/clk/renesas/ directory?

If not, is there anyone else from Renesas that should be listed as a
maintainer instead?

Thanks,
Brian

