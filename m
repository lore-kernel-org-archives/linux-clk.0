Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34153434999
	for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191559; cv=none; b=WGJR4j+JHNBn85D2h1jrfg1qmi7wliRYZ5CcWtTMOPB8uCkRXnlnpSpvOxWWlekFLtW7zQnpEbe0TjlaFo6nOHSAmdpPYfL+4CpIbWFnSAwzzwI3DPu1poMeufHBmrU7oaS4z26KD/NzM64wjEPxT3aou7EK+l8bYaLcpmArqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191559; c=relaxed/simple;
	bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F6ojt5+M7ZBVZ1IxOpWnLvTuEuJSnPsS6UQ9RSnj5LeDfPZ8zDAncsJMFhlYGi1ovCc15AjDbKcAS9r51EUbI2KKajEQSEybTPLJn3YBrfflLVMDwI+WRUxaoA6+PQ7mbv1/z+0RVVqgV/TWNmCc4IVTuoS04ATHQsZAzO6gQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XNYsO8jj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XNYsO8jj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so10060895e9.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791191556; x=1791796356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
        b=XNYsO8jjfmPwdlHxjhGD2gOYE4KwbdRGvaUWB4gF9FQAgJ4UMjq+F5EnGYi6alD8vz
         vggoW7EO7joFFi5tHSjBaE7Zp31Yi5WoTij4qKD6V3kOoHC4jgc5YlglLN1leGAM6tF2
         PJJO6bj7BZ1OBB6VxC4NfN7JM+koXy9ywqhRc9gbTlP1/6YbgHcjC0HFqlk/VQWojjoZ
         ml5orml1Ers2fx5fcOIhzryz4Qpb/C2pOUbCxGvgpDLheFkG1fbvt1MWG9OPTGkIKQD4
         uMyiDAHH1hk6diNTjfjClm/aFsEqGw4MXyVv6O74prYzcXuFw8EKkRhLZe2N+DOKwSIC
         FiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191556; x=1791796356;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEKopGIrQkLh8SWF/zKNuJLXidGRTJJo4QAeZeLI1Kg=;
        b=cNoVtD43pM8ta/EDBGGi3blXy45TFtsR2FU7Ql8sQj6A4uaiBRADtpy2Mu3LZ6Exij
         6yijjCVGJQPS0Q0cyNqbVB5vP4nzs2nvzBgj/dU5/+4Mp5C0GU/T9/40PUP2d+oF71kq
         xRUTJtfHOJg/PX53qJPiil1UF+t0Go7g6R43lk9XbdOXDotRZmXQbBOoippRrj9YgdAl
         UJb+GdTIhVXRKUZ2fw3/m1ZSwKzQsiXSyVcgL5lVR5U0ajLxLvHUBAXpZJCbHhzT8AuE
         FESKEVo/JAJGwBxDp69P49HWgFRXsQeAF0GRpfBEXPpMYHhKMDhv6WV2q817uEGTI+9U
         EOOA==
X-Forwarded-Encrypted: i=1; AKwUvBxDR3v7cNiHCL4M/7NbzmgMJrQAeBOGqAsli5fuqyE6ARbOX/fYpwHIIrZQTqrgCCZAzrs8QSRzvU4=@vger.kernel.org
X-Gm-Message-State: AFuF++n2O5z9+Sg5DwqQN0gZ5VeftzxJKFA0Z4HWDwM8ljo1uZTlMcoZ
	c3ZxK8feGpo31e8FRdJtYC/r74miS+kUO0g/LlH0VBU+P9y2Xy866O7OhwedGFU4L/o=
X-Gm-Gg: AYBFou126CMOfb9mMWA7B2qUPrpGSqS6JZPVE2SjVtCewXb0wPMij3whvg6DnsY0Ddj
	kDYCsE9g5/2rcgPRwEL5AOx0dz4eyCAqa6N2DqGOOQbaaLEQpDobn8gk2qnSxyKiEQ7cR2hF4xq
	2eUjjyFrTfOjdpfU6raPiSD8n8pEaO9SokIrUxL+9kO1trPmf6OouRjsIj7ZiPipuXBRKsTAPPL
	6+uShD8GNWx9EycTeFHwKSRKdJCpArF3Sxt9OJwtQ+d6rzznRdOHtZyJId3lLE/1/Kehqm6wWzq
	qC4VF3as8UHJtuamVkbi/BEbBRHQlfR/ktzKT9yJYSbirs67HjME9yJH4JeXFpDHEopa4C3JYF8
	VF04H/lYuBJI7FeczvOmQnoIX2kzuvft9SPZkESMLXj/xW3JH3+2ElH9h6HvRPWmRqj7kYqh4xE
	l/FX3WYQK6YlWXK3vszux0ekwbVAOSMY++l1krlUN57KJFhSy3hYyBfHntW97ybhyQy7cAEF9kf
	unlwEErc1VpYn7y
X-Received: by 2002:a05:600c:1394:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a02759dc21mr185147705e9.31.1791191556536;
        Mon, 05 Oct 2026 02:12:36 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff20831sm205138945e9.4.2026.10.05.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:12:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
In-Reply-To: <87zewti2pf.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
 <20261004205551.6279C1F000FF@smtp.kernel.org> <87zewti2pf.fsf@bootlin.com>
Date: Mon, 05 Oct 2026 11:12:35 +0200
Message-ID: <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 04 Oct 2026 at 23:19, Miquel Raynal <miquel.raynal@bootlin.com> wrot=
e:

> On 04/10/2026 at 20:55:50 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [Low] clk: nuvoton: ma35d1: Modification of global static state
>> during probe
>
> There is a single clock controller. Should never be a problem. I can
> certainly move it in to more local scope if someone asks, but it's not
> practically needed.

I may be missing something key here but why is not in your defined
indexes like the rest of the clocks ?=20

>
> Thanks,
> Miqu=C3=A8l
>

--=20
Jerome
