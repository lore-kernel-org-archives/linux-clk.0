Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AD015EFB4
	for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706304; cv=none; b=TKzcEBxwxC/xE/LbBgqWgVVrYWjn+L6baXhi6WDyPuxLbd89N9YX/6iNFLS04ElBlM6zYmFe8G72xha3wvOhL32sn40OHDzmixMKxbhnsq60oElhLsU/7WCikKZC3UzKBSEiLi3LZc3OfdR/2hhUqYMGLv7+UvstqUh9CcRhrPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706304; c=relaxed/simple;
	bh=vORZc79X1rnxAyyCpSE7q09cQDfcT1xma8XWqw5O8M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4N+TGLStj8+TG/6/V8kFYQTk2/KhMHZTdihJLnKMgTuf8yREjJ1S7yWi0rCRFnN9Zr1XKGG93wrIPlnRS+bqi0CJJe3RFNIthbai3mPnC/dkSKtSoogyl9drMGWNBBKVvQyDeQg0emeixSe1Jc1eZvxtIq9DbzIzfQtteAjjAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDTs/Rhn; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDTs/Rhn"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cc1528c83so1024989e87.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706300; x=1719311100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vORZc79X1rnxAyyCpSE7q09cQDfcT1xma8XWqw5O8M0=;
        b=bDTs/Rhn9uKuoFnAavsBfVwyr8eFN3dzixLtdqJEB9oNsOSDsJy4WKdgjuPtRwAUzj
         AHUEVSStMVkPdRBONr2O54308oMi9UJH5lG5KAlF2bVCipkgN1SlDe8T/Kb9by5lb6HI
         V8FV4Xxl4EDX3PeVez2yj8KswewrydhK2O64SZxX3WNs+pvEDBqDvE8l/QRdjKTb9xSN
         cqHJYWIr9c9Lo5/xbMPI9BTLjzp3/RlsnD8xKkNeLzALWI3OtXVSwt7X5rCLrBnCvall
         GCDZTA5a2ydaH1arxbAp9niOlhHT2xrlYCbMgKntghwyD5URwYfAqldHiU42tbCgPjX2
         2JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706300; x=1719311100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vORZc79X1rnxAyyCpSE7q09cQDfcT1xma8XWqw5O8M0=;
        b=czBQgf+lBbfsSVOvYnE4wdsiG7eu2CKMpaTaEm029kYe/W+pX1Z6oxWxUAwjzCAiqd
         3XAQlrC2rUFjGSKj65gGjsMhOORSd7YHr7aXsabXNJazgEyKEZA3YsEx7T6nH/V8vqcK
         Eqg1svzxpaxmvqCefA8vHq1AbDzrwIwJaorvM4tjyUYUC9guH+dgFj4Qg55QM4n8+hwa
         Q4iI/7wyUneQrQMdVhRzYBh8DKkGoUzEEnZmQlMpmDodI90XtUvOkN8DZshUMVR1gjba
         +/9C0qX39Q2bn5jYaK5kKSpHbCSM0JrCdYwQedYE9zknk/7VZWzdjwEVytJCUWFgpkcK
         fcIw==
X-Forwarded-Encrypted: i=1; AJvYcCXM5r4KOpO8ipAU2dLP3DtJLb3JVvqQOni6Py3aiGSC8wvpggCjaVER0lRtNA6U7384TWBYAq0RMurYUIBq3ZiRwxODML4kei0R
X-Gm-Message-State: AOJu0YzXZ2NXE7XtjuK46O3UKBuh4KlXj4vXeiMU9jiSMHqVpuxcLwnJ
	rWydTM+4n58V76qGBoSV+dDDzYfdLzgJ1bLE1ETj4GFQCrd3yoD8JDBx9k52RXUI8OqjgaKPCIg
	xQV2xBQqc9mIajhOnRnujPQ8VNJuaNodRm2MYpQ==
X-Google-Smtp-Source: AGHT+IGmdTolgQpGEP2QQMQ3xSyIW78z1iVbi6bOrtMBYdBJmz1sd/on240XJN70b3haSE6d2gxQr6Bx2fcQnQKq3f0=
X-Received: by 2002:a05:6512:ea4:b0:52c:86eb:a2e6 with SMTP id
 2adb3069b0e04-52ca6e567fcmr9051810e87.4.1718706300138; Tue, 18 Jun 2024
 03:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zm7I2Zbq1JNPoEJp@standask-GA-A55M-S2HP>
In-Reply-To: <Zm7I2Zbq1JNPoEJp@standask-GA-A55M-S2HP>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:24:49 +0200
Message-ID: <CACRpkdYEjg==qRSVG_tZ3Zn0kY04pwXX9jMAZL1fQjPybNm1yw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: drop obsolete stericsson,abx500.txt
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 1:13=E2=80=AFPM Stanislav Jakubek
<stano.jakubek@gmail.com> wrote:

> These bindings are already (better) described in mfd/stericsson,ab8500.ya=
ml,
> drop these now obsolete bindings.
>
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

I must have missed this file when I converted the bindings, thanks for clea=
ning
up my mess!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
