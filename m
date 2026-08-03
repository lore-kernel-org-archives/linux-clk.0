Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F03B95FA
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762605; cv=none; b=QbvdjShJjiPvQUvVKSRspVpMIpjJ4vJ6t3QwRpxQVHz8Ibs2KgFfJFn0Fi8Aqw7FkvMJ9BNvEebsQmZGV9R3j25xXG50LkpLMQyM2z2i4TOKTArIj2aXtI6kEhh9QjdrRkWmuDLVDIZzIERysnOz4Zbnbl1m0/3zqV9uRiL9IxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762605; c=relaxed/simple;
	bh=MTOMkVpQfqMobihR6CronKRn644MvaQgNmLnisoTi7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7J1vo9BgABcXzSdKeIm1G0MrrRQiw5/dEPMes13WZcB8TKgAJf5SnbDpYTSUEvap57K//kOfUmxHErqUcL92RKV/oyjZ6Wt/kXshcH3VXQJThunNwNcFo0CRqchz0SzgNmJf3niIzW8TSB/LvmD8FpdsONAP89SnXfigkhdHMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0MFhyAn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dlk4dil6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0MFhyAn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dlk4dil6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
	b=H0MFhyAnlXIjgryr5qICayLw7By+kzvXTXCZO4PtJIrYJ3V9HsVSTlGTgnqhnzbB7CtfQy
	O0k03GXPlnKLmCi5gU1yG44gEJZYprsSIU0TV+4WRRh1senYcf/D5m4ewpVl1EGCj+DNPs
	CGZdFu7DQiKsyrISG9vFe4L4RBSnskg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-hdFsh0dEPcaRE_RkQJ-BTA-1; Mon, 03 Aug 2026 09:09:55 -0400
X-MC-Unique: hdFsh0dEPcaRE_RkQJ-BTA-1
X-Mimecast-MFC-AGG-ID: hdFsh0dEPcaRE_RkQJ-BTA_1785762595
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81ebbbd60cbso51346457b3.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785762595; x=1786367395; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
        b=dlk4dil6iUcVTz4WyG4vxNlD71U4O1gjqC8b1zxqMugdZMHmQJzux2KphZvjDgQAxf
         rIEU+CQ5XmgRraMSVKkhgciY+cJXkLY+URdFUwBMHxOU1mRmDM+lEQZgsM35ZzYQ8dkF
         N4broRpzkJvZzeou/n2F7QMrAUKKMbk0hWxAVp45M/roLiln5Nwe/AsBxP2dTWPr5+JZ
         Eo+Oty+4PRh4PDfrEHOjHf+/UW/6mx3IDd706+EPZFrumqR2RrkQiHrdwcz93tULyQmb
         uAvHr3qhOjU6bCyGdLKO5d2fGbUvMjQudoEZi3qjPtIVgN0QsPn4B/wYf1Vvf8sQ7Wgl
         Cxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762595; x=1786367395;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
        b=N4so9gtzK8B3e6xzZFrl69UIDmdfUKyvuouEqP40ptDNB6mQrfpyObKlk9oevnEFAo
         aYbnuplkBP9z+iL3PQb0gWfM5pN20aQ12pmiB+CGZZX6j9VWUrzMS6f/pGuA/y2ycm4R
         D82AacEt0nUO6/Yqy0rGva7iEUHj/BDBIQxCKAgar4Pt91+oRbi77MZHwXHbT1mAyTbd
         kgl5u3KpToLIEU/Cqt2wOjGMQu6UPNJqgAavUbTzPuhUW+5pcAXDyvX0dM6CI4C16DaI
         vQlbHHSpI9zBDXcxWem/iYtMbx8+mLgF5MMij4J+k7RPZ6xlEPw3A1b5mwLrUwRJNLtk
         X5mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRon+4r7jWp6JRL6XDZZJ5U6BWCyNGRWPI5dLbdaMqY9jcH5sO/+69NRs13WlLGYSY5zICBmNltDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2RhgHYyWM1nXBBQoYcuEWSRYmp/tmQ9dxbyD76krhoDL1C+y1
	jVGYSZgX+60DoF/ij1VisK/C3e2AxgdreJkABd3p7X7z5ZOC0mYUjC7ji2hOjCqTNyT64skbwwy
	+Qj9+ke/O40tjZNpTVcWr3Ba0KUITLV8Umxec7idFepy8Q9l0mqAzoi7ul9d31Q==
X-Gm-Gg: AR+sD1167HyoMIqKxdLQmpkwMWY07QUqbohVB9hTGCwor5rYiL7N/HhVKX3rvebWsXE
	8T2872y/n9a9pCypC22mqCeJEG/b23p3ngMGRHB0zZZ0h5T2sKTt20J89v85MFtY2Ryyhqh5J3F
	etxw4SAWZfWZ1t5zLkCw7YjWRd8IMAJgUgXGNOlL8T5jlOZqghORvOVQ2SmkyAeDD1Vn+ToikPF
	DsuMuf+FAXdoJ3zSmG/v2OJRnfHmSuKX3wZBz41jf0rHv+q3oGL2i+gu67sr0Hxbb3PFMcKhfAj
	ZEAxOVGhaZswmAS5h1aAyqWF3scf8Ce2klGpU304oW5+M0rwYBFETVbMCfM+uuHdieAGDH9M/Yp
	fziZRwTBrtjrMPZXyrHyIvbWZJYMSkpxskzQ=
X-Received: by 2002:a05:690c:c503:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81fd49d3db8mr127611327b3.5.1785762594699;
        Mon, 03 Aug 2026 06:09:54 -0700 (PDT)
X-Received: by 2002:a05:690c:c503:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81fd49d3db8mr127610687b3.5.1785762594054;
        Mon, 03 Aug 2026 06:09:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm55024337b3.5.2026.08.03.06.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:09:53 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:09:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: clock: Correct white-space style
Message-ID: <anCTHhVjoymK6AiW@redhat.com>
References: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 09:55:41PM +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

