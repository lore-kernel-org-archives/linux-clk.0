Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FF4221267
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689469; cv=none; b=AFXQN/PnUw2buwUY0kuC8fwSioKSdcFHbvck5PP+sHZV8gN9ngQLbKFqWFSLvgbEWjLVJLLmWyTHjd/lvaGipwsES04J11iaBIinqR9zOYG+x4evtVjLOU4ANoTC2P4FbN0kW8KN/mow+ORzM/iDYI3yRbpNtud1L6tC0G0m8nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689469; c=relaxed/simple;
	bh=2U3DqoOB9c4gUI0P2Jy+1Db4qAN8DMTnVvxyqVJIm5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRrq3C28geJWQnPnNQRvkQBcxixsE4552fk93vlXqpDXZPJ2WZC5sND/4TOx8j1umHsePB46us0QLp7IY1z7GW1KDnmPIyGiMIsUzp7XBnwOAy6FmtLkz68/T7VleEOZt+JhXs/cYNomi7tvHXEX+95/V/Ii5ufMHE4vhBB2+2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MrvLJUOC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MrvLJUOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757689466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w6+03+6KMi0xIZ+CNaQJK/sgah2Ln0Cdnhj4ONcK25Q=;
	b=MrvLJUOCb1oYH1KrQvBWguPR6dddLTKpfP1OemrSUe/I/zy6+mM1FVrS+Uj6XqkNTael/E
	8qNjdA+mj9GxlcroFqrF7eEar/mzNrPvdI1KuFk4s4rONaTD+xcRgyZ/v9VqQ22rN9z1cl
	G/PsjwSXnRj+smJ58ios76N4Cbk3X0A=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-pnc9l-HpMy6SCaxCiJPT2Q-1; Fri, 12 Sep 2025 11:04:25 -0400
X-MC-Unique: pnc9l-HpMy6SCaxCiJPT2Q-1
X-Mimecast-MFC-AGG-ID: pnc9l-HpMy6SCaxCiJPT2Q_1757689464
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-806f812a0aaso453996385a.3
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 08:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689464; x=1758294264;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6+03+6KMi0xIZ+CNaQJK/sgah2Ln0Cdnhj4ONcK25Q=;
        b=hOb0UWv1eDruTugtlsVt9tsrks3Po/s0G92moRlYAlVmgN97KrbGsY2tcPO8DDDEmY
         MfM/7zebQAA75WyOcIsrwTwiFa0ON7SH1aRCCbNvCGlhW9s5xziu+a38PO3iThBXVZ8e
         +xW3sAAQLNNGjkdY4tO4I2fugjejIqRpw38ZCdnQEWxSXOa7HGnXWjM0EW/NEAE+mzFo
         CICYFqlmxJXiZmWwRCAXqXNFVi6OJSgPzOyQTH6CFoQjKAeU7B3JM2htOH0IA+SyukTh
         6jVf4c+4/JtSmFp3Mb3AYHMt9NEH5ZasOYiXbMjyaqGp2brdIUsqp48nOmsu3OvlZTH6
         S+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXMJG4VjkB5JK0YvxKN3ModjdDXHEjksC1Xx2ygnnrbbqJXd0Gan2AuXfQtLjcGQalHtTe/ELwEjCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1QVHctO0YCuZkediAokrPAc5234vmPisSLZcI/ach7FCJOzFL
	jGrvdBaqH1XgOCbFpB5nKi/nBgcFLsRw/uSaJld/kr3OELtovnOWt+0QQ5r4D8nwTNBAMa2wKO8
	18OcZpvqeNKc+T59lAMH5PmRG4KEsk3Ifpqt2ufs2n+Y89UXulU6WR5jwU8Rltg==
X-Gm-Gg: ASbGncuxcatPm/kh/uXRi6ZNJ02APa7/wf3I/jIwdbss/5tyD0D4Lfntvl9lnFuIBzU
	zV9NB5Nxmc1KzD35V0Z9Zm0QVgwBi2VlnBt/ldsuWTlxUk2A170m4pwSDA2NV+DlFo6Tj5L9IuL
	CEOSc9dMRshUjs0Fx34h0L0DGF9JcziuRN0HYkyr8ZKCbwLCmMy1X6lFc+b8EHxoM81+LKf0XRH
	0K0gQDLpdNbbYkmYFiTJoPcJOvMckHJiHSrBK+AHRar332SY6F2TeHi94zoBRR7iwbUIcWNTfE2
	1g/kEJqLwad1WGF/l/klj2EAXF12MIJ0+XuEszplNDr1TEntWoey5VQrOxXDkUol/9aXiUNxwDq
	HlBJaNVfIGauhnAinYJr83A6gwyeJ/A==
X-Received: by 2002:a05:620a:28c4:b0:810:bba9:d089 with SMTP id af79cd13be357-823fc987678mr477701985a.32.1757689452954;
        Fri, 12 Sep 2025 08:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEgtgh/Gg0WuKmmKqdI04apG8y63BvE/4WJYY0ss9G0WLraw6KPsoUpne6BKqb/M/2Jd8L2w==
X-Received: by 2002:a05:620a:28c4:b0:810:bba9:d089 with SMTP id af79cd13be357-823fc987678mr477601585a.32.1757689446310;
        Fri, 12 Sep 2025 08:04:06 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820cd704b90sm283525285a.43.2025.09.12.08.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:04:05 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:04:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/5] dt-bindings: clock: st: flexgen: remove
 deprecated compatibles
Message-ID: <aMQ2Ym1GL3ZbyAOI@redhat.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
 <20250912-master-v2-5-2c0b1b891c20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-master-v2-5-2c0b1b891c20@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 12, 2025 at 01:36:12PM +0200, Raphael Gallais-Pou wrote:
> st/stih407-clock.dtsi file has been removed in commit 65322c1daf51
> ("clk: st: flexgen: remove unused compatible").  This file has three
> compatibles which are now dangling.  Remove them from documentation.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

