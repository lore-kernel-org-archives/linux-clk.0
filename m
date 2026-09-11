Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF5B3AAF5A
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 22:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166103; cv=none; b=S8tLLP2FKGoWp54S7q5eK0A03sWKGgYIpqJ9z0Okn6kTfgObkGdt9IFtKIMr6fufjEhGI7+fH6xZhmd2W5bKUNC/H9yqJqPVCsUp73Ozoy3gbohomJt6gQmzuvoCzkfc0NkkbM4cC3EuogVjHXH1jBd9AushhppV4IwbJFgzwPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166103; c=relaxed/simple;
	bh=l8iSqcCERw4SllvOimrfy+/dr8qik3CrARKMXuFOge0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GcnmQT2IPvlJOWvf5PDtjdEog3RFOnNHpCtibJRnms+ugsmN2R2joOXMoB/hds5wJCyl4Gry5cKe84kzA5WR8/EZ7YbJuj3y/FvFIYIfw3BcKxfVCqJKTYud/qgOWC/Yc4Mnm2LaJyHxQAgzn+b7JXJPe69tJYwjMfdpDBYEzO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPl/gZht; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQ1xUEwB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPl/gZht";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQ1xUEwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789166100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
	b=XPl/gZhtWjYPLveAEhp32pGkbKr2LUZCt3+606lWbLVwlOPQz7iHZHZZaYX5qvXjDPhklb
	1ez77BXkTuLCs+TPF64qyBNRmWbT5AkS07PABReDiQB8Rc7wAZ47dI6VGcOBZkY2fQG+hT
	pwPeuLJIa46CBiqxHeBJd6MDEqiDqXc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-b31OAoL0MoiWi4BRHkz9uA-1; Fri, 11 Sep 2026 18:34:59 -0400
X-MC-Unique: b31OAoL0MoiWi4BRHkz9uA-1
X-Mimecast-MFC-AGG-ID: b31OAoL0MoiWi4BRHkz9uA_1789166099
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5304f2b5946so27906371cf.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 15:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789166099; x=1789770899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
        b=jQ1xUEwBE/rdnEMO3qsog6OtmCWgYmT40komp9kSdxmz5T5grHYnr3GyHc151+E+ch
         8PTDCtf5h8UAFKXvhdjgZMhNJbLJhADB29GOITbZ/rdlG5t+GcrHn982jB04LUJMsTLj
         MTCZwtNuN5y8Nh/4IR66Ui3ogmcilfvgMB+Vrx2gliNCnmIKT0aiRWjy/086uoRsrHkW
         P8gWqfhdwTGY1ko6vPU/Mv7KmWv770zDDTdrRPaI332JLSBXfGIYnqt/qzxBc3Z6vOgb
         WOz9rM+Gx3NcMpwcZdF1kwn0y4+IVj0Y3i06n2p6n+FYXgm7uNT7THFe72RZ2NE/RmUS
         dosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166099; x=1789770899;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
        b=UNtyD9vkWEoSKpMHLbHLwIrq0OFZs2idVDQc0NaUmPOanXv92FI2y2UXzf2TsUgIXP
         5tJ+MY1raIxAW1SWsUA04k3oiPWaxvRvyx9dZW7h9SONzf6NN5I93HD3ZKyVKwVJlQYj
         Jdnso5kFRkT9PdpCaJx2ImM2DeUZS+jPK5Tza4DYBzWjEYnU2j6DiOKsiEHRx3im/1ch
         XaS2yEuIXzo8dwTZ7mOR3a5pTiHnyYY3NDBwCxV0vQYrmqSdCtAZbZM4RwXTc6VNnPLy
         04VSCMvuM3bth3gG1m3VCgSsUe71i6OBi4Di8ulEHeOsjjKEL62vryS7hl+wJ+Iy7GKR
         jINA==
X-Forwarded-Encrypted: i=1; AKwUvBzWEConFagiE+Fmg5Fgi00OWDFb81V1EZ55v9smdBijVFdMxSRuYpES7Jp4/9i9yxBMSHyP1wNcxOI=@vger.kernel.org
X-Gm-Message-State: AFuF++kACKCCw86cOjOKmvMQdmvWUQUDm6Tm9b79x/UoGpfHcF3FF1dE
	Wzpje/XgrnqMmQhbSxFr6cs2RC4hpPDzlN08/Zb1nG/fFtBamZ3LrFb5jaiF2f6DaQANcI2co6/
	Uo62In5TSCxI8L3F5o+pNAGxNCWBRH1ulqxWnRoYQxfmf1mIEOTj3PyfIUWlfRt5d++kBZA==
X-Gm-Gg: AYBFou3pXDfOzi15YlpJsm7ktCqlfBHJlRWiHgp7D08/hB43xhG59dKpkB5XNozPcZb
	6lNsqOFjznwcbXXaSGyR4bvj8TjwSsqsLz4FOQMVy6WJcO1NmIoCJKRiLgwXEHwxRdqnlaT97iQ
	Sz4C524dKEA//VC+x+oaoBifRqE5aPxiYYEGZ/OXbbb1XtZzSlAPXmQ7HZOc27a3fWLkb5S5HZv
	/Vm0vVQ9cFcES3CL9xBcC8kxceyDTpDnASS6DfpniHisP5y/0vBN5uewMAKdxCJHWu1/3h+TeIY
	9z+JmV1cBskZlrYoISnlAgdDChtzG+2ix5IQSfW4vcbrVz34bw8o5tN7HrnKYum68xawq0S1JhH
	84A3x+sjhUYxid8pArJHt/Brzama+pu2JsNXxYGgp
X-Received: by 2002:a05:622a:1a8b:b0:528:38b1:b547 with SMTP id d75a77b69052e-530c8510528mr108925761cf.8.1789166098953;
        Fri, 11 Sep 2026 15:34:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8b:b0:528:38b1:b547 with SMTP id d75a77b69052e-530c8510528mr108925361cf.8.1789166098564;
        Fri, 11 Sep 2026 15:34:58 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530cc781402sm28631931cf.7.2026.09.11.15.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:34:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
References: <20260910033000.15926-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration
 kernel-doc
Message-Id: <178916608638.746679.11554691931309415049.b4-ty@b4>
Date: Fri, 11 Sep 2026 18:34:46 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=F5o1tXYctjSgBI/LtZLOoWzWpvKzHWB6U29+4E8/BK8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWNHGz1Rv9ef7R/H6WvYPKyV69j11R4Wk/pTJCPIN5v
 ML2ynt0lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJGyaYwM99cy8j566Wpfs/h3
 CNuZP0GXPdlV1c57rtc46s+d94IpnuF/Crv6VYVM/yli7qwb+PrEI+6n7TIX2/1T7fjfJYw6p2Z
 zAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 10 Sep 2026 05:30:00 +0200, Karl Mehltretter wrote:
> clk: mediatek: reset: Fix device registration kernel-doc

Applied, thanks!

[1/1] clk: mediatek: reset: Fix device registration kernel-doc
      commit: 8d5fa37307ac1f0612cf17ac0ccabcc258cc1526

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

