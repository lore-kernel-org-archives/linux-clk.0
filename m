Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7152367D3
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636427; cv=none; b=mN8dOEqh9ZDhR0yjUQLxrM3t2vIcUr0l3G6B8d36KVOaHqqIV4oVqC0LTH5na9rZP4BAjfIeZP+ushaATl/C/H1znG1KXo3b52D0j6FRp8Ys3fVwPspAJEr/I5YG8GY+Dz3dDSRImXo+6apt26wJGBz0x1RkP2E0pPf85Ud2+3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636427; c=relaxed/simple;
	bh=OnVyzSPRGyxt/yed8Pp95yruj+VpaEdTmCsIS3gSEvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joHzyKgo9861x3XIhrF5oB/cACBn4q2wILWWIXMI79boEKDQmWiudyjG90Hzy3Qi/6Xb6Z5XRm9wiB0I0Sq7NnCBSVs1WyAqxOCgmzbGM9dUCfobMFOMLIYYSF70WjaEONqbEifLt2Gi7wlp1s9tGjxnB/RUDQXxKA/AETQEGQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bdf0kFba; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnmQ9ykG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bdf0kFba";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnmQ9ykG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772636425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QsE+BT3d+rRDBDuK2gn8nLOWlG0CDg1jJKOjkZeChvA=;
	b=bdf0kFbazphNwdUw3QrbItsDAjDqkCbJA09e6KlMZsXsaOIUCIGaTpTV6nyT3JRSeHeClz
	II3haUaS+wsrPCKNwZ8/DjsXo/tLnZdc6GKx1yMkUKO1YmU2jG5cjUZvZz7tMvQM7cR6Q1
	VCKyJsQXj27cXzeWFQuo0E0JNgnPvCg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-YMTkxIFrONue6DqA2T1GSw-1; Wed, 04 Mar 2026 10:00:22 -0500
X-MC-Unique: YMTkxIFrONue6DqA2T1GSw-1
X-Mimecast-MFC-AGG-ID: YMTkxIFrONue6DqA2T1GSw_1772636422
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899f6e5b909so215206346d6.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772636422; x=1773241222; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QsE+BT3d+rRDBDuK2gn8nLOWlG0CDg1jJKOjkZeChvA=;
        b=gnmQ9ykGWqeo13hkw5PzSXgDlRFEL5CEswfWF7QP+qaaQJPqpDJ00mFgeKUBmileqo
         7ukg+PUCUrKP1lAvXyCPJhsKHNJiGYtbs0Q/1DarBDKh8U4rYdhDs9nIINaHdx7Hq8Cj
         EXj/YsTvQebSCdVBYtSSDjS3NltuASl78+UM5b7I3YP/JHW8NnaG+SIhSC/gX+8cDBbD
         6OLbt88M5sKg+tsnFY+rRee3Ah05QDAtAltK9dzIucNrdu1Mpi3nWfpH3lXmJGcgcKPu
         PgrN9P9SR4iF/iLqlx6rvSfCtBzojG0rBG3jXo5zVZRk8ma+SLoLs0VLhxTK7afBpCFH
         EsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636422; x=1773241222;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsE+BT3d+rRDBDuK2gn8nLOWlG0CDg1jJKOjkZeChvA=;
        b=Y4jlkJFHPAOn2puzN4Rnz1jTTQznBHuuzKvRWs5wRwnzAEf12YiHXpsIq+IHaJMQC+
         TJrnnA7cACrmPz6SMrljrMAhgMKEXFY/uznvZEPUNuoRXPE/1o2vCDZiHkztTmm19Hu4
         UiyTwafLVjGu4pjQvG8FgKKZ2HUSJs5YbFvTizcJsbjfGu0C1YG+go4lEdQI4O///oua
         4xW8SZ20ADw6Miv3qsW0TfMsJRB+SP+P2KNBqn6mS57P33H5aNUdxPWNHTPS92S4jKPt
         UJd7UdvipQSnigDB7js1mikpzsvxgnrNH0KizcATFEcY4/4O0+tDczTNAywVdJurUTaa
         liYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV179WfluX0vZQx66H/qA82C1TL90sonSYtVE4+9xXSu81v4KzSD2TlLAZ80Ipkn/wOiadnk0a4k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxespBIJDSp6X4ZbhI+Ic8CXuNZAqxqKs8/xYv+AZq87aA/NR+w
	g4ehZ+PhnlC7qXwIdcY5vrP2yG/0kuqcV0BC9FShaotkDi2CJfnskf2HD1d6B95HQOROlL81tgq
	9g5/b/JPUwDE4c+V4bYFp0qB2glkMO9HdZExJYO4x/Ag9C3LgcJbC8BGKVTHSCw==
X-Gm-Gg: ATEYQzzbkgFx01+lRilE60Eoj+SrIcVKLJbxOX2EJDR2OO9SXym86uUGKAHaSm//9Up
	sL3oYlYM5D0nAo/Y0pKnV+htJ393q1Nw9HgeoqJ/FBtIVg/zKjvI2ZCUhrgYjisZr/mRg1CIT8M
	+NYGLDBdqAs2CI3MeZ2Klqqbkjq0DeClsIFRQQ4gX6aF53ph4W1NrcmGWNPXm33dfolabEnnTWS
	3bsVtdZX1VkSSgGmFGSzsIOFoTqLlUgB54ITgRolBH7dyTpVydlBgS/9yukHOU7IG/JJ6cw7mkv
	AV5D3lmgsYfkc8RjKhL3fiMh4pGF2X/dT9vYJ+ORpurOUWzAFirYSGpJusHQSKIIGx5vCN7yn9j
	Ucuyc+WlbgaWDH60W1xWzQ05tJZ89zvbt4cnCQN3rVfv5D2IzLFqrKtfY
X-Received: by 2002:ad4:5cc8:0:b0:89a:1441:b7f6 with SMTP id 6a1803df08f44-89a19987420mr28225486d6.2.1772636419843;
        Wed, 04 Mar 2026 07:00:19 -0800 (PST)
X-Received: by 2002:ad4:5cc8:0:b0:89a:1441:b7f6 with SMTP id 6a1803df08f44-89a19987420mr28220996d6.2.1772636417628;
        Wed, 04 Mar 2026 07:00:17 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7374600sm158729826d6.29.2026.03.04.07.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:00:16 -0800 (PST)
Date: Wed, 4 Mar 2026 10:00:15 -0500
From: Brian Masney <bmasney@redhat.com>
To: j.ne@posteo.net
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tao Lan <taolan@huawei.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: hisilicon: Improve deallocation in error path
Message-ID: <aahI_4lfMdQjZCu3@redhat.com>
References: <20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Mar 03, 2026 at 04:25:18PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> Unmap 'base' if an error occurs after it has been mapped.
> 
> Reported-by: Tao Lan <taolan@huawei.com>
> Closes: https://lore.kernel.org/lkml/ZNlSH+eWV8Sk3FYn@probook/
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

My understanding is that you need to use your full first name in the
Signed-off-by.

> ---
> Changes in v2:
> - Rebase on v7.0-rc2
> - Update my email address
> - Reword the commit message somewhat
> - Link to v1: https://lore.kernel.org/r/20240708-hisi-error-v1-1-727bc7399b63@gmx.net
> ---
>  drivers/clk/hisilicon/clk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
> index fae65127cd4aa8..08050ff1c8cf9a 100644
> --- a/drivers/clk/hisilicon/clk.c
> +++ b/drivers/clk/hisilicon/clk.c
> @@ -70,7 +70,7 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
>  
>  	clk_data = kzalloc_obj(*clk_data);
>  	if (!clk_data)
> -		goto err;
> +		goto err_base;
>  
>  	clk_data->base = base;
>  	clk_table = kzalloc_objs(*clk_table, nr_clks);
> @@ -83,6 +83,8 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
>  	return clk_data;
>  err_data:
>  	kfree(clk_data);
> +err_base:
> +	iounmap(base);

Use devm_of_iomap() and it will be automatically cleaned up for you.

Brian

