Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBFB40F75E
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768321; cv=none; b=GHjbSlYPLNgGrCHIiVC+9b7upyes5Mq0hv0ZcG1W0mROr3phJ2fIKS2rXWKPd+zuDOIsEo8pnaCtfyXt2mybts22q2PC3ZJsuurA9YkcvyJsqOhvhkpdCU5PCAYf17iqbF2IbL3EhUqZvsUBxkeLOJTXFK4sFFBOT+z5Bsd6BLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768321; c=relaxed/simple;
	bh=v84q7Nh8J5RnUECRZxODitRYsGNwHdr784yF/3BQaNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUYgpN6dncrioDUin9JZxsTRtqjymbaKeOK0ljCkFYzgvWJLypePckQDuglUqvG1qoGeL9X6RKmSN+rtVSJ8U9FFhBIbgUTb4RmIVsKd2R2y4pJJ7xSjaOSMxtlzvCmkr4NBBDWgnbxI+uNC+bsr4Zy0bjsxuhFWtDQyrGGhwtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L5WCIvE0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NHHlwttr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L5WCIvE0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NHHlwttr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=;
	b=L5WCIvE0FeXoNtlp7tAp77ZzHOSLiYSOGyJUMohopE0qTRLL4Db15naCwc6A0/2IfvsQz6
	gdHA9lsTJ6HNrAJM0BfVYX/Au8+SrLPahc4pez48pFo5sbUEVNrS4EgyOB5PYJRvEB4HB0
	e3tbXAMTxOO/tnL7ozkixVN9smLJuHQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-E8ZTplpzMpOF_YqIqFVHOQ-1; Mon, 03 Aug 2026 10:45:16 -0400
X-MC-Unique: E8ZTplpzMpOF_YqIqFVHOQ-1
X-Mimecast-MFC-AGG-ID: E8ZTplpzMpOF_YqIqFVHOQ_1785768315
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7fe835353acso53170197b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785768315; x=1786373115; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=;
        b=NHHlwttrMyfU4HslmuAEIhGVGqOZqZxUPlFx7FevPa6kt/Wt1jiMwhjHBvFRudc1oO
         nnnnYYuo4+1XdjrOKjXL/RmhL4L3nwY0C1mTiZIWEIbVBk0CqnILKs+QteOKRcNIobRx
         prkSbr+L4voXxkXNm8cQ5AHBK0FKMIpxGrtAa7PV21dlq2CyabaIUOSxp/dL+DOYgpyt
         tO8WTjo5/2wZGBwtNjjea9MDyaCOH52JUr6ulbLGGcJW/BhBtXMo6MnGJpZomEKQyaiM
         YoCxH5q5tyviWFj74iVIlpI8Dn/6MA6n+Y8mod1U6FhjVVZM15exoKv6Yzb2eJz46f9W
         0Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768315; x=1786373115;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iDCDZV2asWOBXoCVGWr+sD7YN8hRKRT86USyIoiPOU=;
        b=VUR22lPk8gdA/mfdrnIV4/XY0Pje4jUAyslo7Foq/pRNG+X70k3eNgq6rVgoYhK4IT
         ECPoXrEQC1xzYDjMWcYsptRL1dHVSx4EmlAs33lvNkApi5tBAgzqTl3mriM8y1HlGq41
         qdQzLHQQ5VCcw6OctJCDo7k+WJVxEv/W7d/7XJcrI+XQzjNlMqOAIwbLLMJnjgmzf/A9
         RbKEpa+GQJz8WBQVWZRcGDJRJz9D/XwNbrlcNkQVx3sGZYsXUP7jJgu8WXZNSC52LYhK
         Ss9wimjwpZYMV8FwROisHY6AtZkUx9eVGAlKw9HqhUIPMJdI8fX3swDHNo3OKWnscPPH
         70Ng==
X-Forwarded-Encrypted: i=1; AHgh+RrSmkuB6WRD2uZ6+Ifbr1FFVk+pGGydO82AwOax6YfB/55dMbaBG9oCbMD5Cq/FaBWHaMumjBXgYS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpTgYuJYDU7RO/WCUOrOg7EX4a1FgEQS2uOLZPOconT5KpUgz1
	MPwNmGT4V6FZePblfqf3xE8DkQGKA/46z9zZz0sJJACd8NTfV3dV7rvoQ0z5tZ8Qf1mL+vcrYmC
	MCFxOe+3uDKeqx+fG0ku32kx7DTbcvKV+QF3JSWtFEw3BPJo3nq7ODmvwpcfeiA==
X-Gm-Gg: AR+sD125WVreNVj1ZhKMYpTzSbhoGIqmQ2RF/QGQBSMXI/9eqW+v6kcVEMINlG19FQ5
	5BdjvQN2OUR6A8/43ZpF179tJmhloIELYGChtYKb5r6UufhQ/ckzivkyLovC7cKLBOLXOFV2kbn
	NVqXWt1kX0Gr5Njn3+MnDiVVLIgOEMa6SLaw6zorT2kSH24b7bbPTLS2RUqsAODc4YWOYylL5Ud
	DBICY5neTde1RgRDykUsXg3ApU9rwkdariXOWaCaCS5kYY9ddpAHryhZSzfk5LPnklklHXP59mh
	TE0Mrww2lWFnQg4vyUFf/tfaiWSeLN9mzhh+EBJiHy9Rbalu0jSdrQ2K6kBgYxSHDD0/UU7jJx1
	Su6UpzrMkdxFbwbmvzgRaTjjBk+qtgAtnSgQ=
X-Received: by 2002:a05:690c:338c:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81fd4bf5dbemr122417867b3.35.1785768315451;
        Mon, 03 Aug 2026 07:45:15 -0700 (PDT)
X-Received: by 2002:a05:690c:338c:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81fd4bf5dbemr122417297b3.35.1785768314956;
        Mon, 03 Aug 2026 07:45:14 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf841e1sm56661767b3.18.2026.08.03.07.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:45:14 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:45:12 -0400
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
Subject: Re: [PATCH v5 14/25] clk: mediatek: pllfh: Add configurable clock
 ops to mtk_pllfh_data
Message-ID: <anCpeNMp6XQPLU4R@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-14-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-14-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:21:00PM +0200, Louis-Alexis Eyraud wrote:
> Currently, the mtk_clk_register_pllfh functions always registers the
> default PLL clock operation set (mtk_pllfh_ops). This does not allow
> use a custom one, for SoC such as MT8189, that needs different
> set with support for set/clr enable.
> 
> Add a new field for the ops to register in mtk_pllfh_data structure
> and use this new field to either register it when not null or the
> default ops otherwise.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

