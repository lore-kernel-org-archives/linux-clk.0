Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990323B47E0
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756019; cv=pass; b=LgURQuepsiN4dSUZwoKK3b6b++KGmYXiEkuYMpCtDxb6HtMdEw4W+2mqUIGEY5JW13K2gVKW6cByWA+ozTkYnmv0JzsgPmvCWOpf5rWfXAc+AzviHAXe3qKE/0ZlIZ2AALZig7SQVrVicn9MtlPfTY4zYQJzcuuncwRgE9Tc2oU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756019; c=relaxed/simple;
	bh=D/hy75pVVD7xQMDMq2wQgOfcXjFZ/vnrtqqFgtLiMSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1Xujorne3OGJ6gDWV12NyW7kW1zgL5rozlrmQxYMnyQblveZ2DlLpBzPitsB269W1EfJHxi35Wh5gFteHW6ngFG3w4IQkGBeYaTtcZ1BucFN5OOwKX5pjfMYreiL2orEe5tUYY5mza/qzglhlnCQmr06QHPN6lqUT5rPODCdvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JxcVuDrh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dIiGizWG; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JxcVuDrh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dIiGizWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778756017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usImSnNOhuUJlPrs1m1jA0HT6vKRqN7utcXtdHMFR+U=;
	b=JxcVuDrhyWNq7q+X8BiTs52POBJr6b6GX2B9zsK/7LQwT/jNuYgS1IJNfauxBulM9upggg
	BaOScBfbfjQYLBvJgOVVdBNBGOzrkpLLvQrMqQrNVO59HR8SNKZI0G0KVLV5RPGQozZeSZ
	Wntn33stvnFGXx6j3VcI34bgkQrwHh0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-TqDi-TnPNoyLG6wnnLGYrg-1; Thu, 14 May 2026 06:53:34 -0400
X-MC-Unique: TqDi-TnPNoyLG6wnnLGYrg-1
X-Mimecast-MFC-AGG-ID: TqDi-TnPNoyLG6wnnLGYrg_1778756013
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-bcb28103aeeso456611866b.3
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 03:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778756013; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoEJDALlddMi+cQWatB11MiCkygEW7gUfsB46ZM+LzWVRC/cnAz0LIkY6bJuEme6qK
         CSI/Yio2hGkkooqGs8bMHH6UN/wALyqJxx8Ahd9Yi3Q9DRxU5dJJ3hlw9pJdQtc5tpFu
         oY/NVH/M0J1QiloVk9VBqAb1wY2z30ZppAG1SiZ9j+PYo+LsizHuqujkptyf5BvLNRnA
         hV5OhXde5Q2eLE93Sw/dATZQJJ5oKYXPOI2gjlnU4H666p/RY3QrxkmWqVwO+WI7reO/
         uA4BrXf7UzNAmIjDLSsx0r/KbJ0zP2Vr3xUor7kwtNO3ZII1X2idVfJJ5IlYSzKnVOj+
         dazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=usImSnNOhuUJlPrs1m1jA0HT6vKRqN7utcXtdHMFR+U=;
        fh=tEpltqUtTcFQ61NGQLXB255OeI92+9FwbT4OtFwLY+Q=;
        b=OrJV2YJ4CK2rWD2qw5kjyIOvi4FOyT4D6u4Y70BH4HEsUKiEskZodrrmAuudPMjs5a
         Pno0XT4990YhCw0G1MwVX75RQIpmQzKvMZ+TrANvhUPBJudAv3WyJeWue8ticnEEutjr
         9b6NntaHob7PY69swFYkgZi+o/Q0yNTqnFH07Kbt1IbkxstpVb59/f0G5aVyu256bG6c
         IljYK56c2QpvjCxG8iBWxrCYrvNdG6BlduLR1rK/0MuLVNuEwMqGXIi8jd9aw4LbVc/+
         kzpt1c99BBOrjOqMQHqkr/zrlDsBQek1/nUFZlKeTr4eFmWb1EPVtnNG3JXKdNJqnzeh
         41pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778756013; x=1779360813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usImSnNOhuUJlPrs1m1jA0HT6vKRqN7utcXtdHMFR+U=;
        b=dIiGizWGSusXWy/ibbiXhxdbds2PY/AVRUG+CA2kfEG3wV7m3BIgIZcHNk36L+zeEV
         7ECQrbTYbL7Jc8BVQm1ELuXGyVcYZlKSg8Huzq48hdT3pBH12IcPdsGkseiciwN5/8xd
         M3XH91lkG4XjeDk+kIH+WR6G+BMODUx9XiEfoFXuU04cwmj0SjXg2LY+1dnzPXfrP1kB
         a0NonFwCczpuM1m098atcCwfAH8mUMuKIarOTlkg21b/1b9oXE2dYpqd41o8R1P6bA3M
         wHMdxK5VHEAM2dbLbaMN0EYTs+XU+Sm757JwIIHv9IY5M8rei4SYasnIf+e9WnP83B1B
         6EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756013; x=1779360813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=usImSnNOhuUJlPrs1m1jA0HT6vKRqN7utcXtdHMFR+U=;
        b=miroPXFDxHK+hdeva7xp1K0BKmlsQo0BZ/BA9RqSF0MBflWZMwon7GW6KuW9NIjBDL
         FLseGzR0dHlZ2QH2CTuDZlPLbQWA/yZfeeWfAtqZHrPShGTZ/i0NkHyj7TOWaokFVPpn
         FL+0tVGAgIBAdbWzVmE+8UYlAF8+dtwuDNnc75V9PXRYkkHi1Z4XDOzGBNrswezwCtZA
         EdpZQaxZwlqQpFnGyLsHGpc7cJPsFiqnzdTWSD+tp52C0wgpuwba+aim4ftjrtYk15oj
         QQxQUaFXC2qjPC5nmKM6ZWtsKGuYshuNN/E/n6eA1Z6GnaJu0e5/w2Hsc6jnf/TcSctQ
         jPrw==
X-Forwarded-Encrypted: i=1; AFNElJ8TFIqaU213qn0cFsf0so7fPWm1fF9A5De/izY81qDqMdyx4ithB4qmE5Vw1ShyWNhf3JS9iIjFZc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3T+4AhCUzF6NWk77+lib7dPbYBS+uf6YjbP1zVs9lVkt6IpPY
	fShebje8vqf49JntQDrvOD9Orj2tFwvrBaodWjDizPWaLdlC0sErqyO7iPi0K0UxX6UaiACX9lw
	GM4N+vP8RVqPhZjnlM029aSOq03QWN1EErO+0ZjAaEtF+myN0/bl2sdvTOjjwNbmxFfazF9L02z
	maU/llkcju1RCoXpWhT97BtvYk6UrKnPwrC0Nf
X-Gm-Gg: Acq92OH5UHbJ/Htj4y0mBxxepB38CaLc6PshkQuQUGrFBjYoMDJa9MS7cZopsdYLz2i
	q64juBGA00JmaMuBjJVFeq9UzV8SZu6lGnjwIah+TRFzbyFVwWXHHI7g0AgToHINeanh3MuwOj0
	3/a8MsXy9mwllgotNyZ7KJ0nyPyLF6oIj3F8AjW7EMsAGwklqQE+Lr7xxZANExcHT+ETcGeOIBm
	iM/+A==
X-Received: by 2002:a17:907:2685:b0:bc2:1dab:3ea0 with SMTP id a640c23a62f3a-bd3bf772f73mr441496066b.8.1778756013093;
        Thu, 14 May 2026 03:53:33 -0700 (PDT)
X-Received: by 2002:a17:907:2685:b0:bc2:1dab:3ea0 with SMTP id
 a640c23a62f3a-bd3bf772f73mr441493566b.8.1778756012632; Thu, 14 May 2026
 03:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512020432.671-1-dongxuyang@eswincomputing.com>
 <20260512020747.993-1-dongxuyang@eswincomputing.com> <agNLDkz0L67lL0_f@redhat.com>
 <849a595.6278.19e2451f3d0.Coremail.dongxuyang@eswincomputing.com>
In-Reply-To: <849a595.6278.19e2451f3d0.Coremail.dongxuyang@eswincomputing.com>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 14 May 2026 06:53:21 -0400
X-Gm-Features: AVHnY4I3njtjHiuEMuqMw-KgQnpWmuMTMA90SfIHx2cOdhl9yVHttXomqaAjYwo
Message-ID: <CABx5tqLDY+PVoyFeFge7z4BiHjg15tj5=y-uADOiK3sfRcTBtg@mail.gmail.com>
Subject: Re: Re: [PATCH v4 2/3] clk: eswin: Add eic7700 HSP clock driver
To: Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: sashiko-bot@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, 
	huangyifeng@eswincomputing.com, benoit.monin@bootlin.com, 
	ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 10:30=E2=80=AFPM Xuyang Dong
<dongxuyang@eswincomputing.com> wrote:
> I will update the following code to address this in next version.
>
> +       int ret;
> +
> +       ret =3D regmap_read(gate->regmap, gate->reg, &val);
> +       if (ret !=3D 0)
> +               return ret;
>
> Does this change look acceptable to you?

Yes, looks good.

Thanks,
Brian


> > With that fixed:
> >
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
>

