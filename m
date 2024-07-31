Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2791607A4
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455982; cv=none; b=DRg2C6O1ZF9zvIH/CHwHHsrRHW0DrR62yyrUH+D6kUcqE+GyFtBOD53iwl4YnXKim886pdiI2D5xlPRnZG9IpXPI114Oqq1XqxWcuBghi+de2FF++cdvOzGeFptJ2pb1063P+KGW2JyrkzeUUGE0OUU1RS/1qB6V1PA+Xuu/d+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455982; c=relaxed/simple;
	bh=dWIe+SVflan2SsTYfU+ly+kEamX7THOV6NbrTrZgYsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJwavrJ2omtyA3CKDYqfQt0vc/Uf/sbFwF3YyqArXZzgMw3n3RflOaQXq2/AmQ83EO7zPEcyJ79EVbM4UbLOff8HdiQ17p/X5CqLS3oj2HvQ7yMNEGRgD4KyOE7y69+lDG5WouzWJtSWNGy6Y77D0IIJZMWT4yroLL7hL1Cw/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1GQM9Z6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1GQM9Z6"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01613acbso1490484e87.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722455978; x=1723060778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWIe+SVflan2SsTYfU+ly+kEamX7THOV6NbrTrZgYsg=;
        b=T1GQM9Z6q6l5wLlt0eypCHG9rt9+uo6yhpPFTymlrz/3RwsH4oSdrRhFyKPxErLpr/
         MPbcoVkQNieAAVhcDHFWCtUt8tZeMrEY9BO61z149A0P095bTAid2KG6nzA1zwWl3Abr
         RVX2nNsej4PJPXaZ35+TdUqpAbfOxnVS+FiswMwU7F8GBI+pWQRXDO0hFBymML7Xxf6O
         NW7GRvivSvhMHRTpOuz2JCNE5FN1BizavbvfAY7ETSq4WM2sXinoyZ3h6kGQr3n+8bkl
         GkxhOnNz41rEXhf7mwgKazEZHKxDDJj8epjbkF0+bJvEB1roF/uZ8ElPeh78E9bF7CeV
         ykpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722455978; x=1723060778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWIe+SVflan2SsTYfU+ly+kEamX7THOV6NbrTrZgYsg=;
        b=exszVS2ncyhTr2Ya8cF6oyMosQ839qMOBCzxwJJsiGCoM65IKaZNDM4VLKEIG91IXe
         Lr6kwrtfBADfOf053QzUjSwCGhCIBhZ6GdCeiPVULcjhFSK2aFb1KGv/vSXrNDxKHDUX
         l1v2B3YaXdq+tFszFKyIo3n3WIiv7voecAUsZ6+fxMh+4Qv9s4euasCLeVcRa12HBxzA
         Ps8jrFPMlNuPGo4tmWtYcQwh42IjxjujcGHg0WHKCxlQnhd/Bs8lMp1QX9jsdIB0wJig
         FPaGCz+C3/dBJISZ1tvhiaBgCZ4AodB3vTx7C9kJ6DBqKKj2ki9YlXOp37+IB7gRB3eN
         NVdg==
X-Forwarded-Encrypted: i=1; AJvYcCXaA5u+Pfy4YGaFivGaICqX2ngn5VxGDwnHN3qtJvQwoY/8VyAXGB+gNRLm7wVS2IK6zHzckFoiQVAP8nYQd/TP50q2kBRKxUa/
X-Gm-Message-State: AOJu0YxjITidNQ0A2elyhHNJMe/M+9Int67bF6YB08P4WeGzAVYP9ipE
	x8ycr34UGPdGv1QlIazyW+PM9R71lTzhsGa2LP+AewE2jRxumEIGvqUOiXHUEBaPW2peoXUzDVv
	7iBI15Epot/9IRgjh09zZJj+LuyA62p/7XQdfuQ==
X-Google-Smtp-Source: AGHT+IErH91gsiP0jknUbGQePRQcEui321R89TogJGgXf/NOgJfDu4BwCrxCl329HVydBTJibEm0OrBmEJW8f+7EJ0w=
X-Received: by 2002:a05:6512:ac8:b0:52f:260:c459 with SMTP id
 2adb3069b0e04-530b5f2f6aemr57773e87.22.1722455978122; Wed, 31 Jul 2024
 12:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731191312.1710417-4-robh@kernel.org>
In-Reply-To: <20240731191312.1710417-4-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jul 2024 21:59:26 +0200
Message-ID: <CACRpkdZ2wft1MU37fZQWKRh2jmz2HWiCLyx+ihvawWgkvORE_A@mail.gmail.com>
Subject: Re: [PATCH] clk: Use of_property_present()
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 9:13=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions.
> of_(find|get)_property() leak the DT struct property and data pointers
> which is a problem for dynamically allocated nodes which may be freed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
