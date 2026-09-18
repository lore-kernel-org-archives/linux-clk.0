Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD3F3D3302
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 22:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770573; cv=none; b=ll3J4oXpBmpuhY9+0HJL0wy/wqD0rZIsihpAw4TGWZKtnur8grQE/Ie5eK7RLC78eKxztlDvOzzbFwS7915MniSUnX6DJcgUEohb4pLvt8NT7Wp+2+aDO6WZ50E5/Cd/Em/PpPp5plA38nLmFlmDNWqktOVF9eSOp2M5qJwkJ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770573; c=relaxed/simple;
	bh=qJfvIkWQLChcJURKBe1+9TQo1Vq/0W077vbNcPpsImo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mUASKKUWGYsuuoo7CgClSv7qeowys2u5WdK3NPPiurd3v8Ge5u7t+WyRY3KmvHpWzSGtLbRPql6sl2Pa58fhmoJff7/2Ze4LPzzwuM3OSjAPTdhG4o8KCyHq4dUaGPQICqWBG7jnWVHV4sHPZ5CZzmytRXYMHkbxv2rYfJq/Aks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M6pEu83f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q9Wd90Ys; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M6pEu83f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q9Wd90Ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=;
	b=M6pEu83fRCIQ//8AFNjDsjLI5Juh+vy42LmOsPVEVON9SbLC43G/lIMaliKXbZKSFJTbVR
	6X1Sv6E/C6GbBrF8oYp2StTYkMx0y1syBGV2v1ytnudOQ26/Xd5aE8lU513TAZ52TPe2nT
	WyGSWmCvSCI0kITCZoOqJ1aKd8rVWto=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-fGJ9CLUINReEOpEJUQ55LA-1; Fri, 18 Sep 2026 18:29:29 -0400
X-MC-Unique: fGJ9CLUINReEOpEJUQ55LA-1
X-Mimecast-MFC-AGG-ID: fGJ9CLUINReEOpEJUQ55LA_1789770569
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f9e903b02so36056321cf.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770569; x=1790375369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=;
        b=q9Wd90YsCrPSKBVhyijmaFSfZAHkzSpI+1krsOFFUejQqUreZFEo43pqiCHSmELpP5
         f41Mt2nE7DAzRKKmUb2woGdjAndq1qFE0S7jOaCPGMpzUonU2GdSJISZ6MYNxjN++cK7
         w9OGbr0gHefj6ENmMXWj4eB6dVImN5bA3n0LjoGU34P4yXq0w1nJeimbUeFs8xlUMLRO
         bWs1gjqYQojtuZz8+rAvjBBVrKbB8bDd5oii4hevyAppDWrk68UitZ79Fh9vguxK/FCw
         GnAZC4i7kSlooetYGaIJAZ5nWc7CRbJ55e5NGQjZ1eeJ9CurEYvx4zKzby1XZ8Nuswuj
         oeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770569; x=1790375369;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p32LQHLzzMSNCQDrCQVRbQJDsxmVl9uccGFGyZXBagg=;
        b=gd+39bBsjVsrHU1LG+t2XxMpiqkhJCBnvGozMgq00s/jZwGbdY/FecdA0llcdlRJaM
         xm4sbjwh5zd0js4AUW4asYGoFN/JblyOL5uEArh8CPZ0tr8oet6eSmu7rnnarzWjmoFu
         30zL3mepUQGTYdolj3KKv/EkVXgG8WnjQlvH6Yol7kn17tMwzA4gBq93912syR2+S9Vh
         W6a1025uhXhai2gYrprqkDHE7PnvetCmOvGQyv6Bhs0ijOwEMC+ZJzf2JYsuYhuD9QCt
         BuV0wSQcRpvbcOztuQhGXcdcNUqk+C4a0p5RHl/aFF9lk5AWfQBNvmSZj1z1k620tzhx
         +dzA==
X-Forwarded-Encrypted: i=1; AKwUvBxjuaDMG65D/3vuRaPTUxUNxUBQold9Le6unZAMxH+VYtWzxkesV6JafWKZBunx6IOLYs2dxfeVmhg=@vger.kernel.org
X-Gm-Message-State: AFuF++kf1JuDQFcI8s4tHx9kn8UdAyjFlNR3hx36WNcCTlE01R2dpztG
	IVKOSF93ylon0hNSQMA2jV02FeRzFx6iney5dUDZjJBKxa85ooKgnFqOAPWC56+KkOnYqQcMIGy
	ih0NUs+nd1iwrt9+ngLPVHIdhjlPQDBW+Q+0VvKq7P3ghK+66ZX7tOt3XvH8wvQ==
X-Gm-Gg: AYBFou2wq5Uag7dN7Eh4i5EFXT/t0o+hNBrhKJ9+pbbtMXVwskYotZEXZ0hkN1YZ42r
	8xlk3QUA6O2hJaVgFkSFA98bauQ6SJC3WkVGN8aKS+Vzuv5EMGvHQA48lFHHMijbKYWFZ9Xp5PU
	2lqRbLzHxAUerpYvC1e9X4/L8SI0x5lMA/+aUot7ar/xc1hA12xu0KXxZsADtHep72aozYfWo3Y
	3rB+qPa0X6ziAg3eLucyxBwckFT9mKG2Vnx2PEF9RLrfUYYrtnjKmzSsqmErOnslkAXkOXiek+W
	+4nrZkdLPiX3POzPtT5AyACNY3QJd6I94j0Y7IBm+/IsCUesNcc6Xj9iqEBseinZNXWKdMm4eba
	vxw==
X-Received: by 2002:a05:622a:1115:b0:531:1e4a:8eea with SMTP id d75a77b69052e-5328d0015d9mr129233911cf.32.1789770569013;
        Fri, 18 Sep 2026 15:29:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1115:b0:531:1e4a:8eea with SMTP id d75a77b69052e-5328d0015d9mr129233621cf.32.1789770568655;
        Fri, 18 Sep 2026 15:29:28 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae758a61sm7260371cf.26.2026.09.18.15.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:29:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linusw@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, stable@vger.kernel.org
In-Reply-To: <20260915070103.1733176-1-vulab@iscas.ac.cn>
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in
 of_syscon_icst_setup()
Message-Id: <178977052357.517928.2775331133276610419.b4-ty@b4>
Date: Fri, 18 Sep 2026 18:28:43 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=354; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=C+KFUpRy04Zo8PlhMyOdpcWavq81OHmCgPld83aOHow=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLW7na5kVq75sCanhIhw7Zm1+124rpM7lUH3BpVzy1c5
 HziXGV5RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOx/cPwV0rousCtVRntK5yW
 Ty8slf/jddblmuDt7MiJ7kyz/zOuk2P4X6H1c6ea39vL0XltLBNCmUP3SSqX8tmKqZbd+60afJe
 NGQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 15 Sep 2026 07:01:03 +0000, Wentao Liang wrote:
> clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()

Applied, thanks!

[1/1] clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()
      commit: c90a50d07f0c38c62ce13a60806ab5e3b841f70f

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

