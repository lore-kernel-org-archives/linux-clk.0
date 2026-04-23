Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ADE3EE1EF
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949287; cv=none; b=ky3AaSNWuDsk+nK85HPP5cLjkN3quIb9W8RQT6dMokDJhzzj63DriaXsGd7cdkdysBEGuiuux1tW7ojULdYvHPFrsh2gPYZBvjtjL0gVVOUZbhCHzQCn5nROThin39NnIz3++HBEdT4V8AlP3xAeHo1HL5nTtbTTBNPTAqI2vuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949287; c=relaxed/simple;
	bh=xF1Ilk7zDCvwIIrGDLgE9NP4Rc25ZPU/ay0i+mVPR6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzZ5oK+YiK5SXC0GIIKdQ+L4XQm1fUVnaA7Ss6sqpyIVbZ2OqAnFtFox49H0jpTK/zvAQz1rh6rV8M3NV9QHHFFB+EFcTmV/Ju87CJ2+yrELEL+pRq61VMs6j7xNgh2ExWvOYZ5ENZcnINCN3U/eEnEFo8WhfqHQCF3wXkktrLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TWh2qb9P; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JtG5twFq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWh2qb9P";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JtG5twFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776949283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VH6xxw24fia35gW+9WPvHbtvieMfH0+qjPax0v54xfo=;
	b=TWh2qb9P/YwjDRByDtTuZhNjwOz17Q+Epoc/eBCPq/cWqQA6XYD4f1RcS4hRKhxlKNksfS
	INocyIdUWxULzlYyl9w5P7WaVAH1AJIzk7iksaTOIco2yP4RjF9zatj3X+ENrj09eCN3z/
	NI83lu2KIb6NKUutVVQgSptWHRazyMk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-BYT91UCUOBOYyCrv3ry84w-1; Thu, 23 Apr 2026 09:01:20 -0400
X-MC-Unique: BYT91UCUOBOYyCrv3ry84w-1
X-Mimecast-MFC-AGG-ID: BYT91UCUOBOYyCrv3ry84w_1776949280
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b0312bb1dcso156457116d6.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776949280; x=1777554080; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH6xxw24fia35gW+9WPvHbtvieMfH0+qjPax0v54xfo=;
        b=JtG5twFqIbASq88MjgTqC8ZksXxyop23AbDhoO/Vz92q6hudP78gJjdbdNl4/i8mNB
         nOZjZwkh6peaWErNWuISoJkpQTD/VE1VedJ/TnJewkItQ2MlQgzURQnqBHLvL41WIC0m
         bwb+R2Q8gzR7LPMQLaLu+GgoDhIWni+1tP0q6Nn4IBd2E5ke5bkZQvOAAy5H+mO2KWbU
         s3/dD8o7BK/zMNxQcKcVcwWzaND/EqCTKJX5g6Rbpi7zqx9ejsbNlMI5KcBXdKIZwbN8
         BVUua/rFumiesAaghnPPgF1fbMEJxgK4rI0ePWrt6iSZF2c1qvDvH3SVwGfuW3CjiJKO
         gKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949280; x=1777554080;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VH6xxw24fia35gW+9WPvHbtvieMfH0+qjPax0v54xfo=;
        b=oaNAp/8nRfcd/JLvQBwpeNUTv/VWyAvty3q0hmTrLYPrchznzrCmdLh2HXEvjkGkxH
         zHPu0Qg2KUlnYUEYIxpcllQ1i97WSGu+uM29bcRgYDd/Q60kOCzqNROgN5egoJG519DF
         v7EEa4q//fZk/41gZTRXW7kHBhL0KGAgwImwIt88Wc98E3iMo5wPz6qW1sWdmMQ9NXlR
         9p0XDvlAiYUreLTWQnCQ6ZxVElQALVm9Om9u4tdSCrkF+cn9IGs3/RH5JuSZEssMBLPq
         QhaxFckyz/xuSypwvirCXVa7p87VXvJcAgPGToHPcM8thHjpgdo2InPlnYyyRipm1151
         /dCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9okx0DmnTCU/tbCEnkYoLz2IWYonm2gIVlKDMHzbXtlMrPjQZ696ummcU7jgTIvj4mSe00DiuKU4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1leDP9ReRPp5UK3smPZnv0EuSDKz7JR8yVbuIn8e8lYkguDne
	2tmKIFWQv58G2MuVk2i40hnCtkcrFQvZHA7RkJ53kbrnWlpzkkyNSCBHb+o8YpypKf16dH8Z1JW
	jmdECMoJJCO1gH2wmUwEd0uj9vrPpGS5PT8nGRs8GXfEaXy+3UPCXWhu99kHzUHPYTdqqUg==
X-Gm-Gg: AeBDietm3kWJKsId22CK1SZ8o8yTOcUgXJ8Dy7up9/RmHEwS3E6cI2ZyXn4hLsexe67
	c7q4yXVAv7gjdwlInYXzhGf8MiTnNuFJOGyT21BU+3Mrrw8ZvKY/ZqDj1urhnbrQCi0xle3tVgv
	kXXuMBDaO0CZXyeIiAyXNpx73rAUvHbl4APw4VYVXEWMkB/hK5x1tGK3WzplBKsx3U9DMTAaN5z
	ogItEX6oTil3DS5LtyRmQXE+JDHasYsjk+T+9r+vkvHIYg5+w5mJpIjDps4aO/u0dg4tmkd+G65
	ioxB4+LuHcsXfnHd9Tp8gOqENlgiYAFOmuEo47HhK6sPQhlLZ4+8d9sSE5afioAimZWW8tvUM0z
	jB8xq83MyM6SaYanOfk7fQZhiKT8bGsUDGPjJTDGAiXg9Rs4nFwJlcdcf5+WxL5B19DM=
X-Received: by 2002:a05:6214:4d06:b0:8ac:8938:ee55 with SMTP id 6a1803df08f44-8b02802b6fcmr401640526d6.11.1776949279585;
        Thu, 23 Apr 2026 06:01:19 -0700 (PDT)
X-Received: by 2002:a05:6214:4d06:b0:8ac:8938:ee55 with SMTP id 6a1803df08f44-8b02802b6fcmr401639626d6.11.1776949278828;
        Thu, 23 Apr 2026 06:01:18 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac42ca5sm158034416d6.9.2026.04.23.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:01:17 -0700 (PDT)
Date: Thu, 23 Apr 2026 09:01:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: bulk: Use dev_err_probe() helper in
 of_clk_bulk_get()
Message-ID: <aeoYGpkCKHsd0t42@redhat.com>
References: <20260422125313.141808-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422125313.141808-1-alexander.stein@ew.tq-group.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Wed, Apr 22, 2026 at 02:53:12PM +0200, Alexander Stein wrote:
> pr_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER. For that the dev pointer has to be passed along.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

