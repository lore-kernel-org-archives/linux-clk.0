Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84A4AD7F6
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 22:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387276; cv=none; b=VcyLHWCFSQHmJx6fOl02RyqhHGj57goeeL7/Q5pjs9bGtEw8JKYGGO9HULGiM+dusF5fVh3gg5n1JdfdPtJ7qsRhOc2nBOuVGxNl2vNsmrS/4p93OT3BkQmn5tpMzqAhLwYbbHiW3slgeIxZVA7cjhFpzxq5RixOLqkG2wyzF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387276; c=relaxed/simple;
	bh=w/ceBMLpIes5srBdXu6ya4gaE3WHz8ljy9DnLslPOcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pm0QWWxebi63NSLzuL7ZYkZBm98bi6sUpHPndz1GPWlLpxTpUf4pkChazrMU5P8AHlzz05z5x92nWv+/rqcGxNb7ZF6Bvhd74vIbyjq480HkuEsjdlq87xKEUnHZhfT35Qu2aYtjuicaH0R6m9DCpu6fQQwiwkgJ4dOpypTJ6gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+8jtCSF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nFTDwLvG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+8jtCSF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nFTDwLvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788387270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMRUnS9h0I4E1M9rrYsru3/ZHmbTDkVOTPmvmnyeUFU=;
	b=M+8jtCSFoi2+DM6aCYLbJ2XHvn2UnFpFKD7SI6njKBPNPW9m3GGwZ792I3JWg9iP3Jr5MR
	8AiIKEYdwqQ8tJAlQOTGQIGP6TmOaDIUJha/nISpXPOQparIlzfDX2RTMn/3T2knDu9zqu
	Q6rIrc4K0l+t2asXI3UqN3GAjZ00tPg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-biS2QTEnMYOfoqVnUtaYqg-1; Wed, 02 Sep 2026 18:14:27 -0400
X-MC-Unique: biS2QTEnMYOfoqVnUtaYqg-1
X-Mimecast-MFC-AGG-ID: biS2QTEnMYOfoqVnUtaYqg_1788387267
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930edb4362dso284451485a.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 15:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788387267; x=1788992067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMRUnS9h0I4E1M9rrYsru3/ZHmbTDkVOTPmvmnyeUFU=;
        b=nFTDwLvGyPmsFxlcVbtxjEpE6eHPs0rWqBYZP0ka9tsR8MbHO51hVplBaF8TEQNzE1
         e6FojsYOxz7vRAWvzCKXMKJ85jhTxp4dprwmoWL0stf//tnrx/nhfNowTjnuYIbndKQV
         O66Nt+iOCyS9F8T6a1O62itaakRQjeCbAyODVmASxBzNa+D981/aowLRtaGxM6j2AiO1
         2G057/ETJtPgIW7o5Xpa9SaN1PaFK9wNuEtUBbuVqSMjeOeil8hBEvsT7R5WOSmKn5cf
         Hg7UjLG39IUnyKdFekdHRGk14ljugNVNXJCW+TFD66ntIPePpDZuGIvlF4/1lycFzm3t
         p9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387267; x=1788992067;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMRUnS9h0I4E1M9rrYsru3/ZHmbTDkVOTPmvmnyeUFU=;
        b=kVLAtXsk5g925EE+CmcGBQJNubSqiWs15WkNOjabh4Ncal1dfszwhvp56qfOdXii+g
         tmz3YfwljV+zUPACTPl0CkHVbeBZeqG5uXUy3njxsCqp4OF/E6gik/Jy4PsG8NgKBQUh
         W5bqFefHKsfxJ57BtBDklIPrCEre8cmoThWjlb+z+EIEnk8VDXfzN0PTK+0s8Vwf/pGN
         GrQNZu87H9MrBkCNRhAROUoh0lK9MSoXOjfwNDR5gA+jfdw4lxwfIkWI3CYWM1NBAXR7
         XmDvwA0QtguD4GNRxVkj+TJvvfbZVTNsArqFGsuAaa6URYKF9zhf5NKrXoir6VLhQt1l
         /GLA==
X-Gm-Message-State: AFuF++mGSQCE75ks3bjKUY8giJfAJhu7BEFSktgRxb8gCgQz6g1X1FB8
	Ipa8M6bxBmNwXdG02fR97e7B5SHpGogfvlHJTEs1SwhzWlWs2w/0pts0QVx4+Awucv+9lGKkhcS
	bi5cjxwXVIKLLvW7gAglypATSnYOiLrx+T5+67Lj7xuDBPbrc/Qsuob/WkVhWSQ==
X-Gm-Gg: AYBFou0gHmYQUkZRccgOpgaEgdgvmjLwSTVX8vV+JR8QJAQrlD7YVUUhN+bZh9KuWzp
	QIAEKR7/Bl6uKhLtGGDDAShkHBSI9QicA9XCUKC5fE+loqNJ1zxcy6sjXAQOpXiDqRo4MM2IzIL
	e4/MlMfjCct4sPFfZ8fCxJejAZt5F4CFvk3dW8gYdB4hJjwL3VHPQEwygrSIfMXtzu/pdlS9jn5
	CgViXPdB5XWHq9WZchpxVMfjUch9tYz0EQH4Jb+NPhPg3ikXZVZ676H+L2hD3h+sUS5FOX0aZPf
	/ZEgiXlyfRk7spOCiZliu2sx4Ud/ugipPGpVCpfxBbLbHZfBtEyZf2sLb3Ek9OOwMS6HxTdx/lf
	1Zg==
X-Received: by 2002:a05:620a:224:b0:939:6dea:374b with SMTP id af79cd13be357-9396dea3871mr270245385a.47.1788387266585;
        Wed, 02 Sep 2026 15:14:26 -0700 (PDT)
X-Received: by 2002:a05:620a:224:b0:939:6dea:374b with SMTP id af79cd13be357-9396dea3871mr270241785a.47.1788387266148;
        Wed, 02 Sep 2026 15:14:26 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1bb916sm333992485a.21.2026.09.02.15.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:14:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-actions@lists.infradead.org
In-Reply-To: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
References: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
Subject: Re: [PATCH] clk: actions: Drop unneeded forward declarations for
 clk_fixed_factor_ops
Message-Id: <178838725006.2050893.8055946747659778474.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:14:10 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=356; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=UWho1uqQ0CDENJKMvXX+YEGm4bA2kTI7CNsEm75ctQc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmzN99cWbGSYXpOwItG+YHsChGTbuy2IzTfLGjVswqP
 0aBAL20jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACayZBIjw6s/bcZVz26z/3+0
 YvFyl843TlmHH+8SPd145aSy0nPj+eaMDNNMq8q3vIp4/FgpODVs7Uod992W3PUHO/gmFNnzzql
 5xQcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 14 Aug 2026 16:43:30 +0200, Geert Uytterhoeven wrote:
> clk: actions: Drop unneeded forward declarations for clk_fixed_factor_ops

Applied, thanks!

[1/1] clk: actions: Drop unneeded forward declarations for clk_fixed_factor_ops
      commit: e831ea3564120f5eb21a90eb7a46249b5b4f2878

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

