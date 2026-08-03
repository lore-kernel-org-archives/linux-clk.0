Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8066C40F751
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767584; cv=none; b=SGU//O4FGNSdmfFOdMlQqa+jqYTIkCD3fIuQM7cM7uUKgOhVFPFHwtUna5QY2py7a+cGl8kxp4eugjq5KLnep2yJn6kqHAByRFn7hiinjbelQdmgmmPs/cc2Ka5G5Rghf8H+FFAO5diTjDGgigxGXE2ZjJRbGwyJErYy+VJfvmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767584; c=relaxed/simple;
	bh=YZJ61eFfvReBupAod2kvWhHnn4QDKxkEAslDrdpHu+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djLUgx9UzkY+6idWpEv79e91Z5Uw8EnH/KsY6TZJ3/5O1OpF4cXtC9AH3rnOHeBu/p41BKKfyIbsy/3q5TTwj2wFcKYzBrcPBfvjeVvYIitIFitahqUUyr/clb8CONlUP/tD8tjGqvC2CoszDCbUi6QGqDHRPvOLG0ktorUTChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=feA8npFB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jYQOj4Ne; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="feA8npFB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jYQOj4Ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
	b=feA8npFBdir4bsAO8U+Rw3uCx+rw+rGLNj3MYBa9JxyCKxPYOqnUh7qpqwZEMgYuH0b8FK
	RRUAsKnCP++VndsaSEu0O1Uho/nhOjlyvCx1FsMe8NtYbTcOi5MkLQRs5FE67v49mgB93m
	sF6r8u0L8CLakV+eiOFLFlWZsrGjA2E=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-Xfbg5RYkPAeFYB6sEJ_q5Q-1; Mon, 03 Aug 2026 10:32:51 -0400
X-MC-Unique: Xfbg5RYkPAeFYB6sEJ_q5Q-1
X-Mimecast-MFC-AGG-ID: Xfbg5RYkPAeFYB6sEJ_q5Q_1785767571
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6648d902a6eso10239358d50.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785767571; x=1786372371; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
        b=jYQOj4NeViRfaw+Ar2EzLsBAADsqzxzWt0nHwtRCuP92zBwg/6EGccdLlJWwDn8gRV
         SToBk0zRZFihu8S+Kl1qRUkM4Ze5s1sMiF783+s4xVHL/H1m4i0kQ6nQw+xdqIdJaUgm
         dQH9Vyifx12e9JTaN40/PQqoswB/DdNib6yUcncLoTH9c2KPtZ3m3qH7TmQCbZyYQzii
         N3qXEjbnggMNxNX2NqqHpqMFXdcfzlZe31/KOWh4qh+923oZLDIgL4vGKBhXZ0Vxs3k+
         UfrN9/aLYcVjjXazE2j5DH3F3hoFWZa33iEi7H9ma62v7ARJAms67tck0VhUl7mZ942B
         v2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767571; x=1786372371;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
        b=AsyQ+xiVtztznvFlFjVyTotN6ylA5wk+YD6BYYwEoevpp4F8KnOR+o8kVhOJWOjvjo
         P2fkkIHhl6Knfvzfmb9XPXKZT2TZjPO3W/72LuNXx0k0pUA7FT+ikg7dlg2cPKBP9D6k
         Qz70wXWqAeUaxTYAOc/jyj0Fz4wBQu3mOa/S05ztWxFh/eQN2F+FVXweEaPYdwgzNTu+
         CT2mNnaMyIkkadQwUfBeEZ9u4AdqGipYN63Awc+DZNWEponrrOAt4waOjdjxXAbkbWtu
         IBMqPEoqMQe+v3XU2IQgO4vYqT9mg544ePDU57UtUmVnJJxzks+qZW+gkjhXAxdbdFrf
         GcIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGdEFkoXdDfcirzwLeNogktmFjYWwc4MALWJyeNk8EM1AxinTgvfpP60asc62RRIWCSZaFV1zBPZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YySVtCR8d29jOHz8Wn8EUwXiWAbB3h1/8uSy2hMACkXH4maZheb
	5ORZ+Q06D/GBnXyhosl7cHgZlP4ICZ0ApDe4XSqmOvPT4bRXTXQmTWlMHpZeVPfSlc4BaAesy+D
	zXheMJfEglE2hnM7NlnaLiIG70uJwgAIkm8N3CxD/tzGqlV+Y/7kE50Ddvd9RdA==
X-Gm-Gg: AR+sD10DFwR2/uE1jcvCdGmZKwr0vlfwEx1b07DfjNTOqqHInyLOlJoyhj93MIu/WEF
	TfI0uGzyxBGcJ3Pd0W8BSh9qpJT+WCsNrS9YepaUkA0XfUCDU0xXkD/MEpK0WvJaZXn0EieaIfJ
	Cg77MUi2C7JBtbiCjfKjb1b+dD5YGUyq3xXAGZNk+mpyco15TzNnGGl/n9S6kDNDRXQLeJcRETT
	l8yYuxG4Q/ZcOdmnNvl/cm54EtY4G7Kzyl5dzPF2JNMJ6NY5eB+B3ghmx3bLyWSM3xXGg7gy8TQ
	NnHFJzS3EoGV8AkZym6uS92DjzqFCKT5j47jFpupfqWbEr3UO/CLfmf85GgxSjmJNyNa5gUASmD
	a6NtujBSAgQsQ11BXdvJBQKe/TU7Rg8fOzwM=
X-Received: by 2002:a05:690e:43c2:b0:666:2274:f9f5 with SMTP id 956f58d0204a3-6694f1d38e2mr8779907d50.37.1785767570597;
        Mon, 03 Aug 2026 07:32:50 -0700 (PDT)
X-Received: by 2002:a05:690e:43c2:b0:666:2274:f9f5 with SMTP id 956f58d0204a3-6694f1d38e2mr8779869d50.37.1785767570090;
        Mon, 03 Aug 2026 07:32:50 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948ffb54bsm5747947d50.17.2026.08.03.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:32:49 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:32:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 09/25] clk: mediatek: Harmonize mtk_pll_fenc related
 symbol names
Message-ID: <anCmjnAVH1MRkNUS@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:20:55PM +0200, Louis-Alexis Eyraud wrote:
> To prepare for the new clock ops set addition, with support for set/clr
> enable logic only, rename mtk_pll_fenc_setclr_ops and its callback names
> to harmonize the naming with the same suffix.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

