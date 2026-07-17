Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415773FB044
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292318; cv=pass; b=Qii46rcbjH6oAop2ykVXOsipfhs2iwnk37Z6ORTgloDUh3LK6QkX81wZYTn5NUCMjP7pYuhnrkEW59v4R7WuabKkT3oPmw48tolEW145CZLvJWDXK6cg2otj3nIsnu+SyW+0uyMBWX9ADTamSMbZblfF6mDOpfU0i3u76I0DYto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292318; c=relaxed/simple;
	bh=kD5M0yxHewMA0c7uHrs8OxZF+9eaj1jwWAMitK/8aac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLRuAR8qkx9vUlH2j1tKso3SZKMHarb/j7PZUbg8tX+5VHULmqHXpJNWW9FvXMZkoaA2QkaeJtjA3LdW38yhB+uhGtLEC/IRlvBLvyIpxx/TpluJwDR2vDGJ2E+RImn4n/3520X9DsXjHTzRXpwJl8UvKyOE3X0lKBQZrQ0Qfdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0+tfmFP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VvVz/QSs; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0+tfmFP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VvVz/QSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784292315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pP3TL3dXGVFr+i8c+oGuHYFNnUpzLKJThNLNksZVF90=;
	b=H0+tfmFPMPabw7usr62DZBIuxupM0XHDh24C5gDZf/GKEw6NN71CrgQ5YIWKdg3FR3yLNo
	DuapTvEGtEuYC47q3Y05pNA9i4d70xk7E+GkDUpJbR8vtVLdEcmtq7Q5U0Lj+pwjkJJYXR
	8/qu0uNlJ+TQ8Vu8zoPiQ3fJDHXd6ak=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-u8cc_vEYPXia3zoy0OkYGw-1; Fri, 17 Jul 2026 08:45:14 -0400
X-MC-Unique: u8cc_vEYPXia3zoy0OkYGw-1
X-Mimecast-MFC-AGG-ID: u8cc_vEYPXia3zoy0OkYGw_1784292313
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-698b899b53cso4051813a12.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 05:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784292313; cv=none;
        d=google.com; s=arc-20260327;
        b=GdFEY25lh8ivzdaG/2RsIiDB/iHn29d5v5FGu+qNsX2vqDJ8+MqEs9yYKVD1pQcWUN
         uXt0Qy+JbCjjiFBLNkwR7XHxiZvxiXqRLiZ1Orf48EnMzCC0YCf77YmPyHXTDHid0CDN
         2LOWHb5YM3fwuS0HMDJZAK4/zxz0qgI5X0B3i05N97s6sQ3Sm5KYw/+iAqD4iuKbRNl7
         8ZPUJPwkpSpE2ohWExt060WjgXK0bZLQaLnFDJUQF/5UEsQGcJaQFGfBdjhGu55QiKx5
         hrHjzUpbb0+YdK5papUmnZ4KwrruhhkoRRGzHwKH07aaMEOnv6X6D75J7N8zyY75hKkb
         GjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pP3TL3dXGVFr+i8c+oGuHYFNnUpzLKJThNLNksZVF90=;
        fh=NUv+T/1CHTU0VyuWzEDBR6d6pzLBrzketD6dAK+a60M=;
        b=Xke6U7Sblofjj1fQSX3R/DMLTIPYPYWbPu1VdapzibpUSmCouiR8NX10kEC3ZYai+u
         KLx9u2Q8OaG7I3uFLIPdxoAs/rJHoUil/lHqwo6fo0yCcNIJjM72Rs+AtMuk94FAoVQm
         Rjkjn6SYV3zC1YAFVziMISqUnV2H4DwZJ2GYVmeVQFdIP4L2D4tMNyfCK9SaOV464Q8r
         dU9TR/jhYv6JOPJun81ELIG5fzy6eMgRPDJXD87IYIQTLIEnkjkF0HpRbTVuhsX8pwsT
         DlgBU8ft73G1WiV+F2CAHsn52OcZ7imlog6i46Q4E4fs/DCXeuGMc76EcKYxyz43k6g4
         pGTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784292313; x=1784897113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pP3TL3dXGVFr+i8c+oGuHYFNnUpzLKJThNLNksZVF90=;
        b=VvVz/QSsHWvfKy2hAVBtEFpof1XfpKxXKjxoZx4c4gjMDMRrozrFVDDwKl+FWvLZVG
         uAxcWLMv3dAP9CMWU411Uvwh4hipP/plPTCMNBqyCw1BDGDO5crlTsL3RILzLsVUJaRm
         HuDsn0hK68Zsclu9aPCPa9lNtiUY3hB3QHMPJsiUeSHnTbiFv7vnMctdW0oH0Mx2F+wM
         S7aty/1waLWuB+sLicourkWoGZnEaA6hVbqOcwF7oWsjmJrXoVfJDHNYexA3KHpd4qbi
         hfzH/lg1cEjoWwAWcBSHXrtf9NTnZ9IvcFpna/BNe/MDoj8xkUtNDOBto6XVO7jKXkXe
         0qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292313; x=1784897113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pP3TL3dXGVFr+i8c+oGuHYFNnUpzLKJThNLNksZVF90=;
        b=HpoPaPxfrnf8T3HK+cr7KNorUv/MXT3RLuESEh5XzCux6Jx9pS+Byb6WvfroE7FdLw
         ScNlrlSohcXkGGlg2QWLPGXAma41HzPT5l84dZRxpaYQuH6lFGHguXbUPZN2zjZ+9y2N
         QGaCKz0OyK1uT8tdsXAEz9I0NaDQq6rWhnycB9O1r5FcM/Cih+MxF5GcekcMN6b/RSoV
         szUUaT4rOWFTQFTPPf3pZLGP2rh3BqGMvj31/jkdZfLQ8zgHb8qgrMNtQpK/Ir72LAtW
         qGEPLFGveltWsqXp9v2URV5jtU1Hrl0byx0JnVhwa9Wv6N17Us5o1VLtdgsNF87EAqld
         UTJA==
X-Forwarded-Encrypted: i=1; AHgh+Rph+pGPYK+tahA8zKXmQEYFJCv3WzZR7W7f2VvyQnHmIr5qQbTMD2kL3/0eTU+jELdRK7kUDCXi5o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhDVkbSIJ9X3OiXQRTukBzyvrVqYTkL0/k4uxplSnvIY9fCPXO
	Z2/iGxKBpYvThpJhTx8JhmKQotiKqx3kDTAPHUOjUCU8wazzx5e5FoKFS/jpkPpvYeoTdZsw+Jg
	nOy2CyMgBq3CgHjZbsDkcvuEm91rCxxtoy9EkpPHj6xPVhc9JLeUba4JXaTLtSd/w5kYiH5/Blw
	EMJne3Bf+n1qbmsLfniKdPR6S8L88kf0BkXBCe
X-Gm-Gg: AfdE7cmDxcSnnY8TY/cmavyr0EXBor0mjOp0Vns8NKgdI/2lXlndm/TxyoV+WmEPHNJ
	rx+Bi2Flx75FKy4nj6fR37qYZQyM2InK/o1mL/Px8rrsVXWua2Vz+hD1gLoS7MJ+pjbKejGHICa
	Y/B9216YEhN8xZk5P4wZZbHrg7pqZiofoYTCcfmvhe/DJ9Pl99tanndzA8
X-Received: by 2002:a17:907:6d11:b0:c15:b4f3:6d25 with SMTP id a640c23a62f3a-c16b46b8b5emr113376166b.19.1784292312487;
        Fri, 17 Jul 2026 05:45:12 -0700 (PDT)
X-Received: by 2002:a17:907:6d11:b0:c15:b4f3:6d25 with SMTP id
 a640c23a62f3a-c16b46b8b5emr113373966b.19.1784292311905; Fri, 17 Jul 2026
 05:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com> <dUZ-Y63mToq5Uy17STAyZw@bootlin.com>
In-Reply-To: <dUZ-Y63mToq5Uy17STAyZw@bootlin.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 17 Jul 2026 08:45:00 -0400
X-Gm-Features: AUfX_myMBCiSzeVRjqxz-SUywqDPi-aoGufm_QjgfASYzDC7fpukjbKYzZzCFbQ
Message-ID: <CABx5tqL06iPpfLzP2W5YcipmgJRc08Db8=dDRoVOWyVAG+Ww0A@mail.gmail.com>
Subject: Re: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Beno=C3=AEt,

On Fri, Jul 17, 2026 at 4:26=E2=80=AFAM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:
> On Wednesday, 17 June 2026 at 11:25:03 CEST, Beno=C3=AEt Monin wrote:
> > Here is a pull for the clk-eyeq driver adding support for Mobileye EyeQ=
7H
> > SoC. It has been posted as a patch series previously, this pull request=
 is
> > identical to the latest version posted[1].
> >
> > Alongside the changes to the clk-eyeq driver, this pull request also
> > provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to t=
he
> > reset-eyeq driver acked by Philipp Zabel and a small rework of the
> > fixed-factor clocks reviewed by Brian Masney.
> >
> > [1]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@boot=
lin.com
> >
> >
> > The following changes since commit 5d6919055dec134de3c40167a490f33c74c1=
2581:
> >
> >   Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/benoitmonin/linux tags/clk-eyeq7h-7.2
> >
> > for you to fetch changes up to fc58615596c5bd701d868813ac595489f3939d83=
:
> >
> >   clk: eyeq: Add EyeQ7H compatibles (2026-06-15 17:42:32 +0200)
> >
> So, this did not make the cut for 7.2... I am wondering what I should do.
>
> Should I rebase on v7.2-rc1 and post the series again?
>
> I would really like to see this series merged at some point.

If the series still applies cleanly, then I recommend sending a second
GIT PULL based on 7.2-rc1.

If not, post a new rebased version, then around rc6 post a pull as well.

Brian

