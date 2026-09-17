Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D784C10CF
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658309; cv=none; b=RQqezjeBccLA+S4Jhj8E6b/TpmZtRROOqZF4phYbVUmrfZ3Ny/cXSDwzDVqfpcnivPf2gk/hvxV2cBNWplHoTTUZDua9mANSOOWFNRqX41LRNKUgaUzyoNrU/+IMU0/tjB/vHndAvFvseA4INC+CfoNrhcqY6tcPIhYtuV8gkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658309; c=relaxed/simple;
	bh=5OHa+ebGog13f07xLZ9lyOPg27hGouffI7pph8Du8rY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YiajEWKj1qZJ+WwmiIzSROMb8DTA8wtQ66gQpUWUpOPSzhNFJfTdbLfUZcnqByGCD1BEi0BvH1fZ79Ex0pwlAlpWo+iH7cTatxe3Lg3C1aaJxT/oKjNQUnABRWP5NYYGSezMWd+NVvzU2NmhBoT4XNycy3vQ0OrYoPblixREGiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RY09ORei; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IsZgyt2F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RY09ORei";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IsZgyt2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789658296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OziTzy4SV0rdP7QT5/3o4LU2t6LnQ939r26ChBP3tKc=;
	b=RY09OReiAcYr4Db/Hsyzm0Y2unMJRSNf4hcZVhkmoDSaCwlGZbITj5h02wBi5kNzDwgE9P
	rBGAL10Dt4+Jr8t7tYlXIoULTvmnSlBFoYqGuPaNnx60HcsgMrUNpYMzVrEs2t49KDGdR8
	r7mJiRzcHxnHYzV0DTVXbN68/7wn7V4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-EL5uyS6KN36Yz8B4YzG3vQ-1; Thu, 17 Sep 2026 11:18:15 -0400
X-MC-Unique: EL5uyS6KN36Yz8B4YzG3vQ-1
X-Mimecast-MFC-AGG-ID: EL5uyS6KN36Yz8B4YzG3vQ_1789658295
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5328dae1305so27650761cf.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789658295; x=1790263095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OziTzy4SV0rdP7QT5/3o4LU2t6LnQ939r26ChBP3tKc=;
        b=IsZgyt2FEcOZnwhL7nW7/Rlt0RuZz/MKx5N8KfJF+VuRwOecY9ymiUPlrHJBMPl6UC
         1k7PtQBPI9EAOIUvx48HorYrQmFZ9fja4CvGwpNPMKgjnI+40BQ1Xyc9DFW+vduF+WMZ
         PhUEXGply/L/s5q9tcTwAvlUyLECZCZz5ft4CU8h+n3cnIqJZuxBY0BlT50IpvFSY2qq
         md8jQ0RWPnIVZjSFSfT4BQd4Aeh462xxOPjJtTp2Ae6V8KJlPotgI5JJwCbOTRzda4sI
         0iGsbyfJPN/Tm0Rat2byitAALvpdyfK26FPiIpyM5yz3DtsPf7WRob5DTGtgZzGhxsXo
         1xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658295; x=1790263095;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OziTzy4SV0rdP7QT5/3o4LU2t6LnQ939r26ChBP3tKc=;
        b=EURat6L1AqEdkG8Kx68BDF5VUtRgtsnbjfB/lCPtoOojWi+Cg4xJ3LOAjN4QmQhVtl
         MJkMa4VxqRQU8dyqD45YCPE9zFJCGyybyYBCregRVXA4YKP7dNI8nCPQG5raiAnmEEvM
         14n2hPEc69BKBpypyKBhR4zhyxUARwbi+Uz0FHSAws8CqaGUPSXOCfAEinXxnc3UW91b
         4erUOLkZXPwmOj/dG+FGkN4EBMOt2ubun1fttNuUfM3cUduAcpnpq+mdG5KKMk9rGCRP
         ti7LuZ8XWfgH6G+YR/vwHNvZOjDL9MA0gk0ihgDfiHfKq0Pxk8U8X3H4lndFjb5ujXTV
         Xz2A==
X-Forwarded-Encrypted: i=1; AKwUvBxnkC4644Eic+8B9sbmXhRRPEsGDtG09WxwmLF9VEw2z0DWSdJmb1YmyBLole4yUCT8RtEcc3GZnw0=@vger.kernel.org
X-Gm-Message-State: AFuF++nsm6c9y0XY5A1BPeZCi2vRqCvXHxKWLICdb+1lNzqrd9Km/m6A
	0OYZRydrNk8YLxfI/mrkj2GaXXSOWETPQdZacN2bgV466/+4Q400lW2vgvI8KVNr0xEZN4FSD+E
	k5v5cw4/wM40PKt/T1UneijS+s7ahu9v2xl+bM3C+WxClK+b2xSVt9V0BBpULHA==
X-Gm-Gg: AYBFou1NAF0lMXYiKHKiOjd79NFYKedNAaCYZYdTRg73wpFAiRy10kez4s2tJr+MK6T
	DtFZGUNUbYbPiCWi8AD/du3YTqUV0QKQqsBoCWTkhZWfhyTplkKMAmRAFeydMQ3qZYA1vgDDP2h
	BAdYfwdzM6JR7dPzWCUn9f+DGz8RWT7XHfhxEokFySK9S7GuwIy+aPciz7wxU/UtFz2xgyW2ZPk
	Jzh7ScEZCdhkuWaKTjGvu8q4fMs7kk6KAYShyc2J66w5eLMg2wFMzfZW7a0/+d5NcmWOQNGmJ5v
	KqawNcjCK7t9D6LPX+X6D+qKxdBDT0xXpre0hqIuJeq+wGQUCmjlm1/grjgWlQdS4KoX95/N9Mb
	PkHo6pMBCVIA1qkiTGkrsLaON1O6rn0i/OWhNQpY=
X-Received: by 2002:a05:622a:134d:b0:530:98bc:3974 with SMTP id d75a77b69052e-5327f260d6bmr122394311cf.22.1789658294569;
        Thu, 17 Sep 2026 08:18:14 -0700 (PDT)
X-Received: by 2002:a05:622a:134d:b0:530:98bc:3974 with SMTP id d75a77b69052e-5327f260d6bmr122393851cf.22.1789658294117;
        Thu, 17 Sep 2026 08:18:14 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53261fda5a7sm54054561cf.8.2026.09.17.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-clk@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Message-Id: <178965828458.360090.13517236488404002811.b4-ty@b4>
Date: Thu, 17 Sep 2026 11:18:04 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=292; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=QSpex/un9vsD7Byia08Y7HUcWbITtTxNA+HFXAQOZec=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWsGyqkZNmczfufBfb+779J5fQtPJpbRs2ss5YGT/78
 Ot304+t6yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAilUkM//PiL7I03vIUk2W6
 Fvyzfs+Sm7k/ln06lrqO50joxeuJffsYGU6wTCzReuWhmr77YdxKz1V+F1qlndQsDed9uuVbu8e
 6nhcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 12 Jul 2026 18:03:01 +0200, Karl Mehltretter wrote:
> clk: aspeed: ast2700: select AUXILIARY_BUS

Applied, thanks!

[1/1] clk: aspeed: ast2700: select AUXILIARY_BUS
      commit: 8932b4283488ea91b1a67fae7a29a505f1d6e965

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

