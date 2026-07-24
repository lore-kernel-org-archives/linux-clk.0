Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08DE175A95
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908197; cv=none; b=Q8t2VlX6k2Lpv6ENXWQ03UIDmU8TImpLw7yJxInhNCoDTBVUA8LwEl4xH5lxeuaaf0seAM7cFgEuBf3aNLQGafXJuwrZjHdGGdNcM63VOuYoPuxojHjdvalSn1sb1X7E3CD/cimsXR8Fwtyf+KwMdLjWkFyTOSddu0EpLidJbYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908197; c=relaxed/simple;
	bh=j7B4danz/ZEcE9/NjNIzey4qh7P8tB8Rwlo/mr7Npf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbNoZCHLeVEbpG/2mlUtMMAGh0ExdD1+DTeH4sIKEzafHbMHD01qgmkYJGbleBA6TwwNJWZgyaOgZOiCZnanRivfbui+K6xN9IEbJXjtywOv8Io01+rQvf81SzzcXbrbCMpfNNErLyqySp2cTvxArTKc2LPr6tS9zUKeE3Tpzyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c3vLCwh0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nDyDRIX9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c3vLCwh0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nDyDRIX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784908194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XDO5JZJvZtfl6cmues5X36AY0ZaUTn38I+SGeN802WA=;
	b=c3vLCwh0ICToF9G2vbnhGK1FXvRiHw31XJCN25DqZtR1+ZFfXe+jn1sOqDPmy08Pl/7Y2R
	rXhEJ5MmOMFFAOZoBGuR5XMIyWklV/sBMtVfrgh1wljUk+1+NigkaJjvdP9cUxu0pVMnE7
	8ol/rX7CywxNKuApb1MZDAGA3xUs/G4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-J2KoJhhqOvSEe28eg89g0w-1; Fri, 24 Jul 2026 11:49:53 -0400
X-MC-Unique: J2KoJhhqOvSEe28eg89g0w-1
X-Mimecast-MFC-AGG-ID: J2KoJhhqOvSEe28eg89g0w_1784908193
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so9469321cf.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784908193; x=1785512993; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XDO5JZJvZtfl6cmues5X36AY0ZaUTn38I+SGeN802WA=;
        b=nDyDRIX90wUsAuIiuDMJXBqmmk1s/XaGU5oskdv2/wmj3W7vrjsFa5/s0yqdnoobjo
         BGTG7Uy6jlegOFngAXufqPGHxCRgCo0WqO3Sc4E9BvlMqYJBqTl/pzYdhduVR28NCs2j
         NibmTygzTm8clyT3LMBLVtFXHF+0vGeUBNrVQUqX/bTNN6bxrUGgwh605/a9/DKeJ1Lo
         n0E6fJeUlXNm857dCOKIso2rivZv7MfyAHM9dnalHcRKyyEx3mvjQSz011C+wbgCvdB6
         +4okxcNWZug3vDQcQFdl0ByvgeMFI1GzsdJiqARafUOX2yK1AWbvTvowKYQOWdq50yVO
         OTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908193; x=1785512993;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDO5JZJvZtfl6cmues5X36AY0ZaUTn38I+SGeN802WA=;
        b=foVkNKfV2bBNJA9cI7EtpI6JleO0sv4tvrTadVc3SVu5qwvckX2aIH+NcHu68swNce
         iZFnBDqchQMestzFbR/aKAsvLqrB4+XlCjbpX4WXPeRpOfIcaWtEy5SFbt3aR26rehMU
         SSdWe/QpfV7TTSe170yBatCBTGpSQZr2dzCq/9QFviJwC28NcyIQ3VaT5g7uY9B8QB06
         AfZzGOOiuU3VocBAdTdX5swjN/TMFwairbYvshvVpoEm/7rM4Ba3aO6YO2tEM15GE36T
         f004Vpw78XCgXJw8YMPzJ8z9jR/SAnzBCLIjxvrwnd1lS1TylpQatrqKlR0tcTevJIEC
         s9+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrs0U1q5DrzH5Z/eq8zeh8mEhchmM2+/UcHXX//WWYQJTPF5ZlSLuiJtvztI0TX9sW6e9IUfCrfZAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/pWG0a4aFfj3PRXmvSO5Ph0IAmBy4Y26SfSmlxNxiI9M6fres
	pkrf9YexrcrEsN8/yRb9q30b7nDtMRF/hgyTHYx1ysVU0xkp8uHpPNARn3VvrX+7pCIcalDe3YZ
	QQQ53i71z2LoOvRr7YaJolnc1LHuJ1M61cTBmiE9jED9uOGktB5oDc7Qh/DDIfxLqZEAQqw==
X-Gm-Gg: AR+sD11imKY1zsNwthw5GaSIDSm7DZK48SlpAcZ/vsAjKmTj9lYWEhZCzHV5fPTKte4
	bjpByvRc5GrKwWAaG2U0b+hU1bz5aP++3GZDBAdz8z+yg6QRKVoO1EXp+dtVMI8xD1NbpAeidFC
	GZVn+5UgsoPYn6ThcgphTyFHPwE/vEKvBh3pokk74IAK6Y55BWQZLSw46ESz62cNFKc5MtDHyWR
	tV6IJeSe/a5OwEBlOHSmC4aSMxwQ2RFopL6XE5sL2WzLirOcc//wiUIZ/ehXL4ix27pEvbFwEYM
	3zMTC2plFgGjbsk/FDpPt//1m2MP9k1H1gHF+OUv1giIVRZi425blgREIDXnczIpXEWBh0QAPK7
	5oUNtt9cAQw5gL7rjftnbuBStRFB+vUgL0nI=
X-Received: by 2002:a05:622a:8c:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-5283df6172fmr71861191cf.71.1784908192827;
        Fri, 24 Jul 2026 08:49:52 -0700 (PDT)
X-Received: by 2002:a05:622a:8c:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-5283df6172fmr71860711cf.71.1784908192117;
        Fri, 24 Jul 2026 08:49:52 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a27cedccsm2245391cf.4.2026.07.24.08.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:49:51 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:49:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Julia.Lawall@inria.fr, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, cocci@inria.fr,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/36] clk: remove conditional return with no effect
Message-ID: <amOJnX_SNO6M0XAB@redhat.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-18-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723184538.3888637-18-ekffu200098@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 24, 2026 at 03:45:19AM +0900, Sang-Heon Jeon wrote:
> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
> 
> In the lmk04832 driver, the hardware sequence comments are moved
> above the final return by hand.
> 
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

