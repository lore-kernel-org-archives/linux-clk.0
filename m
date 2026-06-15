Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B52382291
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 21:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558939; cv=none; b=NuDqsnPA7Umc0JFNfzxFcJN02IMbCVX+Ulk00ThuUn6oaAMEUIxTEMdfxWDJZTsDbFsNqIc6qy8jrgzf6HIShhQmUrrhSfqiCqz6NMs0uf0SKQlUJYAkdyVtcpfpVjAKD0etLZb1ai4dtIvpdk8uL7SPTjpw2eereno1eOSMNtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558939; c=relaxed/simple;
	bh=i0JVg6NPKDqPdCm8XtH+7L8mGlKzlTAmtPgz4+TozJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhzJ14z7YXTOt5Q+TSgLvpOly7D98dUx9RFTv35LnLmAMOBhJQ/xRLa8fF/38bW1DHAyhts3hQdLBJoCah67S4LVcmHGn9gnY2Nvu2wCYMG4G/l6cFTukUFcxIvvw9V2Yx6KklJrbnk597sFk7UIN0fZqZavYKKDiNGZFoqDxa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O0oX8rgG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fDeKCHMX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O0oX8rgG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fDeKCHMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781558937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=;
	b=O0oX8rgGW7kIcNrGrvNSy9m0VCpUTeyqM7Nh9BlpSn3qRk1M3zR4PsT22HPJQ/0d0gzDq3
	iHXOSZsxpPGR45kPBmy+UjiQ4eR4SCvdK7L7cfHjOCtufBrqUiHUJNfM+LWaEtgzdJXGGn
	ZUnmWOQCli/vS3KpZ0qTQ30n2H5zzbs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-lGuQh89aNo--nuw32s3P8w-1; Mon, 15 Jun 2026 17:28:56 -0400
X-MC-Unique: lGuQh89aNo--nuw32s3P8w-1
X-Mimecast-MFC-AGG-ID: lGuQh89aNo--nuw32s3P8w_1781558936
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517ac42d958so73354651cf.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781558936; x=1782163736; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=;
        b=fDeKCHMX+lQ830Zyaxwp768jl86oEkj3stdG9OtY689Uemx7+nwYMq88jVm/28BfRD
         ZppFZA2I554ac8zFBwZRO8qjCicF0f6bzift+15hP9ve5/okFZ8xDMVKBgFSg28YMm1K
         j8uQopBD3/oHWfBmiycJEQwsOMIGQ3PlCRPDI8FdhOrD1p4hsr6C6VH5wIkjqfJRQ3go
         ve860I+FpgKP5uPHmbMX96t5x+UeAnV/CJySluxTbc6ctGZwgmfaXeO6YMK2gQ2+OWrs
         c2lVyipVoY47Xki4Lnd/+Zk2z7bwygNBlY3jHdysahBYpUe9ecmksvDSy2DaN4NJRhfv
         673Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781558936; x=1782163736;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=;
        b=MUQYdviIRxBS0W/k7jBU3gWU6hWAxnGkB/deDdvKH2fLUeGXOIHIDBr+OtfBwgTAP0
         wcucngI2iMsiAGLWhhzFHyp15daRcrIfjuS6bNu/W7VHA18TjLfIK67wYg2ngmcGy3DT
         sdKMVb6fS9Lt5R38HqL/kCmym8qldwdc4sfS9q4Naev9EwFyQ9aSUqoOg02eMz8YcPqD
         Tj6IQAZA+ZclwK1rb0t7NddYkJeJ7wF8WyTfbvxJg2n8l2oOlA/XHiEhd8JLNdl/cFZQ
         NX9bZdhVgmAE6zNoOaPzoLrkIvy9YGoN946oGUdplED+JtVakHY649NZv+LSkRSzzm9O
         zm2w==
X-Forwarded-Encrypted: i=1; AFNElJ8F+/z/a/3v+SXSzWx6wktO/OscDct5pXgk4IK8tqp+pBRrfP6q11A6gUwTmQNETSBVS7OxJVQSyEU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4JgTIjZ0sB9wxiZRT4gSFLConEIKtEaYmryvOPm1qmKe/SRA
	93u9WBa1qMKQejg7c/qCo5mRNNsC0GdwRbeVPLxbdE3EUpOT6G4LXBrrmLN8AlbKdOVrLFnr5TQ
	SzakDO2QUI/QPxde4s3VucI9dm6ZY9BprSiK0Oc2QMSm7+dT3sEgI+so7XaaeWg==
X-Gm-Gg: Acq92OH8a12U/uHrHJCXbCj3aiRTJgcPnZ32JVSVuBSK/rcbOFl61t9tGdw92FtK4rU
	5DWMLC1chBdKWHm6KBG+VbutKK4TN2ndBsNqwnpPbEdEokM3oYi/AKJRFLxGy1umEr7lC13/pt5
	EblswgdfoKeJWtkgTxIGMgWLy0LxLiq7y9djA1J6Z0B5mfMDcAatf3LbC+Pb8pl+oYDJQllQkfa
	RlrhPZUiSfNoHaEnbcVVjzy5xl1q0TijR+9OfpbUkEuJlhV7yRzzyhMqfjcObqRdH80aAqRwFDe
	79ogHsmxGFsY5AenDNv5zYvI8jwbyfekwPrXzC8VgHoGIJmvTbJ3lizyctQXzUsl/TTzpgC40Op
	L97EnbreWU7Zuy/oGBm65+sxYm6c3DVSPg9Oxl/+0YbcxEPxSXRBFg0WH
X-Received: by 2002:a05:622a:a310:b0:517:79f0:ae3d with SMTP id d75a77b69052e-517fe23ac1dmr180027041cf.21.1781558935526;
        Mon, 15 Jun 2026 14:28:55 -0700 (PDT)
X-Received: by 2002:a05:622a:a310:b0:517:79f0:ae3d with SMTP id d75a77b69052e-517fe23ac1dmr180026601cf.21.1781558935056;
        Mon, 15 Jun 2026 14:28:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6442d8sm119356571cf.11.2026.06.15.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 14:28:54 -0700 (PDT)
Date: Mon, 15 Jun 2026 17:28:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v8 00/10] clk: realtek: Add RTD1625 clock support
Message-ID: <ajBulHwzII9cynqI@redhat.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610080824.255063-1-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Yu-Chun,

On Wed, Jun 10, 2026 at 04:08:14PM +0800, Yu-Chun Lin wrote:
> Hello,
> 
> This patch series adds clock support for Realtek's RTD1625 platform.
> The series includes:
> 1. Device Tree: Add clock controller nodes.
> 2. Infrastructure: reset controller, basic clocks, PLLs, gate clocks, mux
> clocks, and MMC-tuned PLLs.
> 3. Platform drivers: two clock controller drivers for RTD1625-CRT and
> RTD1625-ISO.
> 
> Best regards,
> Yu-Chun Lin

Sashiko has some legitimate feedback about this patch set:

https://sashiko.dev/#/patchset/20260610080824.255063-1-eleanor.lin%40realtek.com

Can you go through that and post a new version? I'll review the next
version manually in more detail.

Brian

