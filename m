Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821D36B934
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700517; cv=none; b=jSozVcV5ow5U5h/ohk/iQlf0ZWsUTEL3YtbGar09S+yo+NP5Qmm8mAhTqFfkWv4xTdXIt3GyYO5q6KAwjwhWWh2xSRh9vNjSyIoWHiCalS6cTEyKvSK6zQmL7IzBdx+2X5f5AkurBKLEZ+dhqNuVdyaF56Y5RpW0zjc//Iq8/r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700517; c=relaxed/simple;
	bh=gjzKEDoEc/+GLpE25sXuiGP4bdJDlHX/8bJR6oQseoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mBdTOh8kJUDQnmFLZ+xljnp7q1n0bas68L0Q8fm07dGE1Qn0bb3OH4w0zy/1phdVWOwlLKIRiEJcP+uAEnMxo6kJ8XQVV5JTd/5EtpDIn+TGGLxqIlt/Gnr8Dtciph9f/v5U2EUiPiwcgGgfr6r40UilxgeS7gSoDdQXVaS6RM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U66cTeuf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HMOurltX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U66cTeuf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HMOurltX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
	b=U66cTeuf+pG4nZC0Gq05rli9sFWqokHK4sTQaEXJe4gh043PDfJpfCKzKVxopgAJnawGQo
	WAA9/XmDqc82m1DBfUnQAyFiCMEiLuaM3Ixps0jktgSHjZ3jaWqZibQneYAaYYqr6ZQ20z
	80SRElFGGgg5Ppmte8ErDAe3qYogkF4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121--m6idgN2O_C8AQ0veAOoNg-1; Tue, 29 Sep 2026 12:48:27 -0400
X-MC-Unique: -m6idgN2O_C8AQ0veAOoNg-1
X-Mimecast-MFC-AGG-ID: -m6idgN2O_C8AQ0veAOoNg_1790700507
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91442ba2e46so72677276d6.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700507; x=1791305307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
        b=HMOurltXsOJYedqYy2XE57vGiMrC20OlOC83Zt6b5srtERwK3mpC6Xpgxd2+JHaeFd
         yDMpIhnWZjuhRqqXdbROXN7rICAr6OvUvovYJfPIJhBMKmtLcLDx4CRcrcGF0izPd+Xw
         CdQcLBgRbHguV5GzpTZuU8/cHNDPsv5fKCUxN2TgBwAmBYo+cZC90IJtnM1IrfBxva+Q
         0M46B1q+yzz1sQxrz+qbO/BmQ9xSGIpDvG0IzutawEBwuz5nX48livdkXIRWP/NgOtK8
         dqCz3rZJur6CKbnrTENg6p4HLqPT0NqqriTU87zo4hmtnfjQcQOZWXVHjQFbnO5e0/Hy
         oI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700507; x=1791305307;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
        b=XjXn5yxYe2q2V6V7GLwfKQDr1tTY5pXRpML5sTXzezPyC6KQuOjbPDhBz4tgPUU+wD
         miNRDEPuYH68EtLC+r8pVPbTjAO8LRd0WMWytpjv1MHehALEiqbf0ylGc9luXjukvEBo
         Ff5/e9R237Ru/L0f+0xY9lyDXEuG/3d+/zJ/gPZUrZioV7SPLq0VTr/1DU7Pdtxz46ic
         elWCZbK4vgssvjXCzJzCp1xnwj7fA0iVTWkzW7T4AeAV7xFCl9yRzecxxoxblYEaQiw2
         o0zUHFoSAtHoR4v/D8YopkVdAlQ4BKUgI/el7M1DZ86TsEU60ts2IYoI6yBMzpzFT9vJ
         VQ2w==
X-Forwarded-Encrypted: i=1; AKwUvBziGcXVKYV/nWkXXIDypvAzYQYq8NPch79DLjafhubNT7pg6mAwr5bmZw83UyQOf75yYjhNP75CVCM=@vger.kernel.org
X-Gm-Message-State: AFuF++lamnVik2+QgzJxlxZLhnR5fIJQtR2l3RpfLu1j1vi6hUGdieZR
	+6AoY+M4wFoWBROC1A8WvODoyeYp6rVO1yk58g71F80Us8l+yUtY8KFzhArYE69cJ+B1egiEKJO
	lcaeVH8k67kncXxE9P3NCWI1idi4NnpV+en2vlTYMESKX5t2y24vL9+1lVX7KzA==
X-Gm-Gg: AYBFou3wzDmDYUHzkZeU29L33pt444BAFIvN4eqdIXJjVdk3nqRZ/avbb1AdDZK0p2F
	92GdnoHhLdz8NKyhJ/7Wk4y24P823BaJj7RxpQEogGk2pLEyEhmB4NfPps7jedkj4Ejcgt8tDLZ
	ZfGl+8J/URPnI5b62igm2rK67yK2QEpAm7BFiHvn2NPv1FrhIfcCHkt+s62hAQkpSr+jYD2cakN
	SXwwY88zcAa2iJU6Pdxi5NuMByG1Q3kwjgnFM9OWwCAnTM1rYOSuaW2fhK7uDl2hfyRGvFInBlK
	G3Tc4/WGSdiG4RU8ZRk+UY/UCUeXyrfYrWN23FS1OOa431/97C6mCa/mvsxAFnGk4xHM2lnuxF9
	dnDQC14BR6OLc9gJRSrSuN5hHqJeF4+eGxherIs2KCtNb3wADj0k=
X-Received: by 2002:a05:620a:700a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93c9f90d39emr21400485a.47.1790700506652;
        Tue, 29 Sep 2026 09:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93c9f90d39emr21392085a.47.1790700505852;
        Tue, 29 Sep 2026 09:48:25 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f54529asm10347985a.37.2026.09.29.09.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:48:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sebin Francis <sebin.francis@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-Id: <179070048452.199845.10870046832708018931.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:48:04 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=705; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SAHYf/h8Oe0K/ekB9Nro0D69org/h+4brL2o93Uibw4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v75WObHBi99/6nvz91sfuy9/aBE213x2T6bCawPDb
 lVWxc/nOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjILQVGhi1pPpPUYzwFivpu
 5+WFhLcrLrx2Yo2ZS3zjMwHTvjirboZ/GtcvfHvLK77mYvkzJi1D73jODRmTUlvF/1fM2lIoJ7G
 eBwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> Support spread spectrum clocking for i.MX8M PLLs
> 
> The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> PLLs (audio, video and DRAM). It has been tested for the video PLL on
> boards using i.MX8MN and i.MX8MP.
> 
> While at it, it validates the spread spectrum configuration in the clk
> core before it reaches the providers, and fixes the i.MX SCMI OEM
> extension, which converted the spread to the wrong unit.
> 
> [...]

Applied, thanks!

[2/4] clk: validate spread spectrum configuration
      commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

