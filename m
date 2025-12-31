Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125F330AACC
	for <linux-clk@vger.kernel.org>; Wed, 31 Dec 2025 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767215677; cv=none; b=k8yIm6n3PuAxLSnIsu9mGlw5BX8w7d9+lu+nPuUUtpVFMJgKrV/XzxYlwAmaVF7Ajvq7xvchdsWn8dj1alN1iYBJrtDixscBM3a0uhbOiEppUp4A9EE0oUODCYFtcncpwmocbrz9arUDTU2QnSeILCRWiBkGPJTZOs2/JV0X3jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767215677; c=relaxed/simple;
	bh=K4TEUeoaO3Y52Zdb0sC48zPiMP7vx44cLf9beQ8lFUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAXkeD52JbmlHNwD9R8U3rZoGnOO8D1IWC6PgUpYVwEKnlfWCfAfBSshGLEg+cDo1Xk5HP92O5AoFOaK81nrZzybNeiFsySmaP5SadY8BdbBqbnewpQ905xqFoiHm4b8AD5VaUlD39OatDHFjdd3wb4aabmYq8ZL8h5mgD/Dzac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCwwiqEs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCwwiqEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D438FC19422
	for <linux-clk@vger.kernel.org>; Wed, 31 Dec 2025 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767215676;
	bh=K4TEUeoaO3Y52Zdb0sC48zPiMP7vx44cLf9beQ8lFUk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZCwwiqEswXEGKKvL3rK1c1iUUeTe07ylJCi004T03JiGsfm1sehSD0qKxxoIN5YBL
	 SpWukX28dXmdBqxntofdEUrkIfLbfbAPpwAHY9ma+WCCqBlHsfZmiOHOkKGv+uPLsW
	 pRJP6i4rEgNfgG5DJmwCJP5bunV7/geTsuIJYEmk+Lulb/QRDK7EOCGzpESkxTfuT8
	 Wdt1ls8sFU+8L1T0gvhBQ++FBhxDqTwNGZrNiEn37M6IuZRB3YhySIozl8IJuYCHGt
	 HmzOd9kpqTm4KKwiKV0SJPXQKnD+6SRtvLU0KJKCoRskRBT0iQvB7/VgS2b5nn/aKn
	 PxCbWpbMiWhgQ==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64661975669so10680377d50.3
        for <linux-clk@vger.kernel.org>; Wed, 31 Dec 2025 13:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxxyKEwvUcSXoxznqWjPMQ43/slu88DLgouIWieUbL2AP/061n0tB536y4Dcg458cFQLgpCYB5JrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwthdXqFIbtn86bCKUWDJQ5EE3q3/3obWFESfANxVjc7hUW0T90
	YmTRt3xHVieJj4M3SZBASow1De6rpwZxajnWD4RlVnXLZWhbf4BkUfSWL2JWvi+Td5cRARGBi0m
	ovfpw6t5Ce7Rhfm5DNd2IDBqEWxw5bZ4=
X-Google-Smtp-Source: AGHT+IFJoU7C4Ss7IKWO6XLKJPZbPbx+H9CysI/sBI5pxN+Kri8LOHqU0WdhmLCYk5T2fpBiV3yt6in3C99aq1OMW8Q=
X-Received: by 2002:a05:690e:13cb:b0:63f:abf6:1c9 with SMTP id
 956f58d0204a3-6466a898fa5mr28072326d50.25.1767215676220; Wed, 31 Dec 2025
 13:14:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com> <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:14:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=cnukn6K26AcpZuH9qz0SrSEK0UFOZ4Cam9fy3sOavnQ@mail.gmail.com>
X-Gm-Features: AQt7F2oPWkcnbzjWCUFrnvPI8TjcTBVugqqVg9uhszVX238b4PDh7WzA8kho9U4
Message-ID: <CAD++jL=cnukn6K26AcpZuH9qz0SrSEK0UFOZ4Cam9fy3sOavnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: versatile: impd1: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 12:22=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

That's neat.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
