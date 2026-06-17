Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF12E739A
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694092; cv=none; b=qJ2I62VfqFgfbgJnvPdEugrCep4hZWo33tk6FcyoVbVSWk1JcaPgpvRiBr/nDoFkycB1Kz/qH00JrnJWyxxeqHTworvZj617nBRXhsb2AY3ToPHwQzWv8vefWAAWcCr+yuS3VAiSu4ZfrIb9ZsGQwJkjQ1+Pk4fZbHRUfvQDj3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694092; c=relaxed/simple;
	bh=bftScsotNvsRcdpHxJ8awpRJeOKGTdRa8s480iopQr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7LqTZ1ZnQOOVFHNom58Xo7oA+lSeLT+ov4ffM244VAfPm6SNqffgHsvTJECCuwLT5W8XqSRinXMQVDmOR8OfSjVf6M+xvcscm23p0/vFGd7fnZFbqmQOEeroiNZ4IyxadoSuJ6/Nd2f9KLGYXP6F04ilPI/U2ypnHVcRrYg3UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ihSZ/yE1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iI4z4pUT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ihSZ/yE1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iI4z4pUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781694090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TcYVumjXtOCP5kzdiYOwgOj5Y9zDw6OkE9mWprckgc=;
	b=ihSZ/yE1VmOkbNEIZzO91Gke70wlIUIfxZ7Y+mss0NIAWuxMME2oXHhPezPOPPLLoUbYFG
	44EwIASyLzHilHqSeivE8pBAGAc1gJyu0kSpGH7TYgnbfH8SWjO7iCrSqZ0fcbSO3q0S6r
	RrhHUSjTjOh7ap3atU8iSQfLu+zb0k0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-pfzo4DzuPCuHiShvovzWHQ-1; Wed, 17 Jun 2026 07:01:28 -0400
X-MC-Unique: pfzo4DzuPCuHiShvovzWHQ-1
X-Mimecast-MFC-AGG-ID: pfzo4DzuPCuHiShvovzWHQ_1781694088
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dc4d71a6abso4315416d6.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781694088; x=1782298888; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TcYVumjXtOCP5kzdiYOwgOj5Y9zDw6OkE9mWprckgc=;
        b=iI4z4pUTNi+U39mmIMrvh4Mif/yLoIHK+UtkKBOFwHNoyjQpYNcojkAihOC930McDg
         FaKBZDeWfHDTQaQmBsPSRgrcfmT7Shk2QYQsh0o2wdHpmel3eb41fsUsUG+Vj/+9op3x
         ZTmSuwsdR3MUg1W8sQK2GALNojPHgEgI3XobXWqJD8baAV8mGeR5VBFzwpAVhORvEdD/
         fkvTTy6zwQygNXAn8lOx+axJRbbJSDv0hG2S7E6MwNt2a94PjiU5Zve2GzL242ZxiLu9
         hJO6j38L0MPkQ7jd2WGX3JiQwdt8ZlgxAat2nr7QcNRgz7MAcRmINvV9Xxak0tOphKf5
         KQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694088; x=1782298888;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8TcYVumjXtOCP5kzdiYOwgOj5Y9zDw6OkE9mWprckgc=;
        b=TW0F+tctVVC5b7YwIwSiXbBbPPJsMUnFe6z7aC39cTCO1ndcMpb26r2W5+yAsxi88N
         L4dAfVxvS+SPQGwy1PI4sNfwJQSo1pfAhfYWkFZb+rLBVhnDS4g2G8ibJWCLzHCmu9I4
         zLXLvrPLusRK7ZpxdZ3plcT7KUSEG2qqhwrKvOU6hKLohAjzvkPcNRCOY30n1MiPwMr+
         qDZAizK+EpnL2mAjH31M/D6DM4oaPGaYOXpDTQUn+IR8w0bEj4zd2gWyUKMb28nvHSaj
         /FJraqyVfn+ExIgXC5ZkP4vuyeDXGx3J0gXIrmwYGuOHqlNuJWe0HQdcAS2QinU+h/MK
         omUg==
X-Forwarded-Encrypted: i=1; AFNElJ8e/jN5uRL8qH4ToXiexi96yhR1oGfZ1yhDM56NnPpovY1XTGAGapqmU2j/flsVBSsR4ds3xltvsrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/HZW4ZeUiHvNOPfZ2k61iiWb6C31/Q0YpsX05dJOzkVF5pjp
	p44hFoLyXavYPa0OoJsfbaqOafNkx/ECffD/kKk54UpcvzOJfPo8c0pB6ZFpTU4d1SBVhZWpy1n
	nf6vTUoMaoDW80mSxgT/2H6tGKALSutALhqTJzymZsMljxk4ICbbbo9wTRdHRhg==
X-Gm-Gg: Acq92OHKAAQyX8pI07AEzyELLM5pjYm1y0T3l7jkEUXR1b7svwMcyhIo/Jf/uoOair8
	4+s/sXkJrDBXnpvtiTGYXy6ATRssTvuRsSQi4dOIB6EP/jzYGsQHUCcen7fSllaez6s8CbtKOYb
	Bd3JM2hMDtJCoOLHSQmuss9YCqLIezj0NL05qUDr8LiVsk6zbaRlmza41+OZ2LI5pthEwCCfH7f
	eBwllFT0qeqQ9REF2UJ/VXrqXgz+fm8kL0gxT7+vViDjssKJvX9JgDlIU9X3vwKUg6FkEXkBqqj
	+IbwDVgVKsb5JfforOpDe8kUyGa+v1Y0uCXGqksQwHBd/i89Fgy58yVJ1oS+kVMkMdS5uoYJL+l
	qzlUB0hX+4A/AjxHQa9LB1BiIttKCwQY=
X-Received: by 2002:a05:620a:7103:b0:915:d10e:8c4c with SMTP id af79cd13be357-91d8dcabb5emr573977585a.42.1781694074825;
        Wed, 17 Jun 2026 04:01:14 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:915:d10e:8c4c with SMTP id af79cd13be357-91d8dcabb5emr573733385a.42.1781694058081;
        Wed, 17 Jun 2026 04:00:58 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1c851sm1732803285a.16.2026.06.17.04.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:00:57 -0700 (PDT)
Date: Wed, 17 Jun 2026 07:00:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <ajJ-Z2ooI_Wd9J4a@redhat.com>
References: <20260617014126.1716291-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617014126.1716291-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Wed, Jun 17, 2026 at 01:41:26AM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.
> 
> Rather than adding clk_put() calls, replace the of_clk_get() +
> __clk_get_name() pattern with of_clk_get_parent_name(), which is
> the intended API for this use case and handles the reference
> counting internally.  This matches the pattern already used by the
> sibling drivers clk-cpu.c and clk-corediv.c.
> 
> Fixes: f756e362d9384 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

For the future, if someone leaves a tag like Reviewed-by, or Tested-by,
then include it with your next version, unless something major changes
with the code. Don't post another version since Stephen's automation
will pick up my tag when he merges this.

Brian

