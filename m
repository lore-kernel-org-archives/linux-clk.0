Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814041A239D
	for <linux-clk@vger.kernel.org>; Wed,  8 Jan 2025 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339071; cv=none; b=KUuYwdjBZnpQ7n7aAo8tRnk75mzqrUiKWD7zRH2jhB2/zydslTvL0QONaUDagZd7iz4qHPJ0mC4lx8ib6beS10HY978f414btPAn9jcv33m45s2kHJ6UfWjymId/sJpTP83x8t74TkZHP+4o07t6Oi4cCFwQkKSvUVoMc6ECgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339071; c=relaxed/simple;
	bh=EEZcsEfifcrolHDeK2C0y3CKPbavDiw9RWFa5ARHKSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddNEWV0mGcCu8zOd0t++x4nQWEtMesu3WGUf3aaXf6Kmsr5o7KcK+qRPzC8LoZlmfJzsSNI9CuH6TD4jCriFIGmu/Jb4kHgaJ5AOxBmr53sq/zqiyjjzBpnugDYPj3Yuup7jv71/yzrkkib3VcVTI4vtXIu5x65BjRL6cLMcmj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0GeoDuf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0GeoDuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736339068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cdx+XGbRNdwURY4Hv8pOAMDFCc1aSxRSKA5pDfTqufo=;
	b=d0GeoDufmRafI2ExnANm4QgEXYb6f5CickPdY8y8x8JqAQEd7GlDN5N7j3GLHTs0boUTrW
	YfkbUcoDpleElbVgpcnVGUb44vbxWKWL1XrcGK5svFbvNyzkoGdn05mDLHKSinYJMdMIJr
	zVmxAWNMkxw1IgvkNev5VISpvoO9E9Y=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-bq_ayD1pMQmk9X35AlGuUQ-1; Wed, 08 Jan 2025 07:24:27 -0500
X-MC-Unique: bq_ayD1pMQmk9X35AlGuUQ-1
X-Mimecast-MFC-AGG-ID: bq_ayD1pMQmk9X35AlGuUQ
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e54cb50c3baso2126721276.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jan 2025 04:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339067; x=1736943867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cdx+XGbRNdwURY4Hv8pOAMDFCc1aSxRSKA5pDfTqufo=;
        b=f24t8nLZIK5BYiQT89fbzvCBLq8tJrLm+ir63fthUYeJwIyEF2dwcQth4NtDPdR0Lr
         E22NUZYoO1QzxWRo8v7rkPIdgTJmHOiQWCpt+FMf7so2fXWcw9PiUpfkAXOlgaWhK5CF
         0BhPA2zyCLaLxOPkXj7fgWtwa31UXo/lblLBLARoSxb4NM9ZQBTFaUU0Vjvs7geA17W4
         CmpKAMSBT51gHv8ziYu0Rh43CwG6V4s9i6oMXHjAZRqKQWJ+vIpuJ03m/BcFAKqEQlyU
         uBZhdQHJE6qKdNWe8PB28PcWkcy2K9rEzgbUZz/msY7iuHLXkld66gWV2HnK+8xySXEf
         yWAQ==
X-Gm-Message-State: AOJu0YyjidwCu83CYPqWobgfaGHrAoYHFnkBcQ7OK7m2i2nCYvohMynw
	o7DhgEpwJuwtWW6w6ed1zBMO2fpzYkIjx6CoXAC9NijHxP02nyCaakwA1aykHKZ+R6QuSFDHL8J
	xh4PTpSKi0WxQB0eO+a1GtKMqF9E+Q48o6UuchRN5FTww4Q9fCbARFya8Imm5ln6W7jXlYzAoIB
	haB38nKBmVpIv8SRAq3R0S3JCUq5kug/qU
X-Gm-Gg: ASbGncvC2jWez6d028trHyL2Ekm9mqeZEtOwv/qkp4Ttf4BmO8INHKucVeClTH+5dSm
	Esh4kB4WClsNFz7L8vW2hrBOORrdoGD8BpLokhw==
X-Received: by 2002:a25:ef4f:0:b0:e53:a993:1610 with SMTP id 3f1490d57ef6-e54d24ad23amr5139052276.17.1736339066914;
        Wed, 08 Jan 2025 04:24:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn4b7ASNROGog47LYrRwZDZlW0FEte6PVQR+uCTjoVK/KBZqYckoFdsrtfFUhtbKREXzNP8dhgipctqE6uBpk=
X-Received: by 2002:a25:ef4f:0:b0:e53:a993:1610 with SMTP id
 3f1490d57ef6-e54d24ad23amr5139041276.17.1736339066666; Wed, 08 Jan 2025
 04:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231190336.423172-1-lkundrak@v3.sk> <899f7dc2cea70fa6bfc22ad08354ec98.sboyd@kernel.org>
In-Reply-To: <899f7dc2cea70fa6bfc22ad08354ec98.sboyd@kernel.org>
From: Lubomir Rintel <lrintel@redhat.com>
Date: Wed, 8 Jan 2025 13:24:15 +0100
X-Gm-Features: AbW1kvaSJvtl2PyYrJvsByLclnPw3cvAaeLsj7lyQRnlXtSyPz0FXHAhbac7FCY
Message-ID: <CACQFvQEkshRte2CYtHQ7=_0EqKXMkv3jVCtZTU50D3d91Ea5gw@mail.gmail.com>
Subject: Re: [PATCH] clk: mmp2: call pm_genpd_init() only after genpd.name is set
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 10:37=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Lubomir Rintel (2024-12-31 11:03:35)
> > Setting the genpd's struct device's name with dev_set_name() is
> > happening within pm_genpd_init(). If it remains NULL, things can blow u=
p
> > later, such as when crafting the devfs hierarchy for the power domain:
> >
> >   8<--- cut here --- [please do not actually cut, you'll ruin your disp=
lay]
> >   Unable to handle kernel NULL pointer dereference at virtual address 0=
0000000 when read
> >   ...
> >   Call trace:
> >    strlen from start_creating+0x90/0x138
> >    start_creating from debugfs_create_dir+0x20/0x178
> >    debugfs_create_dir from genpd_debug_add.part.0+0x4c/0x144
> >    genpd_debug_add.part.0 from genpd_debug_init+0x74/0x90
> >    genpd_debug_init from do_one_initcall+0x5c/0x244
> >    do_one_initcall from kernel_init_freeable+0x19c/0x1f4
> >    kernel_init_freeable from kernel_init+0x1c/0x12c
> >    kernel_init from ret_from_fork+0x14/0x28
> >
> > Bisecting tracks this crash back to commit 899f44531fe6 ("pmdomain: cor=
e:
> > Add GENPD_FLAG_DEV_NAME_FW flag"), which exchanges use of genpd->name
> > with dev_name(&genpd->dev) in genpd_debug_add.part().
> >
> > Fixes: 899f44531fe6 ("pmdomain: core: Add GENPD_FLAG_DEV_NAME_FW flag")
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>
> Please tell me which author domain it is supposed to be. redhat.com or
> v3.sk?

lkundrak@v3.sk please

My apologies -- apparently gmail now insists on using a gmail
address for mail outgoing via their server, to the point it silently rewrit=
es
it in messages. I'm also unable to use a different mail server from some
networks. Sigh. I'm sorry about this, I'll try to find a way around it
next time.

Thank you,
Lubo

