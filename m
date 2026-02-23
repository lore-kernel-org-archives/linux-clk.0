Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4D29ACCD
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857300; cv=pass; b=XSpww7TzFtkskD78e3o3KVOm2XRzgD+wH/h9puCuHpWbarCrKaoLvWxu/nBrWr5pWQDP5PUCQOwVtWPa1yyGbGKnSlJo3W9mC63L0fXuLmJh3RSQtez5zHdTKc0goI6I/JnYa0c2czTQRaWaPj+LX+989kDpcfgOLRPpESv15iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857300; c=relaxed/simple;
	bh=HvOYLcElekz+hDX7Jna93XLYHDEzVU8smwFySHb8Bm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7U+s42RIpTinS+GyVROMa07TbiBZcFsltYFBzp2icMAt7t2XLC5lDqWTfw0ck0Jq6mZJ8pY5z1+U3uGUe1fgFzoGL6z+QtEG9ajNCSP6mEGPYn+ejvjMhDUmlWdAbai3YfvUcJBic/hb/0kzBfj/T+jh1rdLcPLMl4cyjz5Wy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhBXIkoW; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhBXIkoW"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38706b63929so39640531fa.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 06:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771857298; cv=none;
        d=google.com; s=arc-20240605;
        b=KPWf16F0Emtpf1CLvKW47q/Q98w15GzA7632C85JlIz+K82I9vAFZhB7YDUz9AGlj3
         KUB/Sog0IKXCP6RMBjSX9smn3aCiCQZ6iMEpCsOceXnLudZ6A4lgG5m5ZeKpavP0kfJI
         CoZqVUf0Nsc5+1j2fispxjW98J52ALPtqli27JjAgP2/OX/+HzvRvEjaCM22Sq23HaBk
         0BQ8Dx/FtxIgCK7RmRS631GRl8kpgjvg7RowheSojoN/k6O4insDkmyGlJMyOjFD4H4F
         M7fhGFz5JzSAOSZqH0hTIGaavSFPCsw1mUCoRMbAGqlGnTTXI5sWpJ8hGbjrSvcOROId
         4TzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvOYLcElekz+hDX7Jna93XLYHDEzVU8smwFySHb8Bm8=;
        fh=nDHS/G2ZNhq5hvzhE3F+TLDTKQ866+W1jGk4AAQBqoI=;
        b=AmQY4s1NuJcDer5aAngSv1ebhq9tiA40m+EcvMby2LVeOe4T46HrMupQKAi9kd8IHH
         ayZuOd6Z9XedVbOUuKZON7utFvcVQsoqFKjBAJryGoytWzFbjRpbBm4B27tGxrPGhcGS
         brOqOb8Ni08ljXt276JEPMJoooT8HxmlNAOFAh+KDVtloI9SBqrJvMmR5MDfbYax6mjL
         YlAxWxLS6/U9TWuhXi2n8qtoUbCW2L2wTQ1FYIS6vNqZ/5S8CTSEX1RYsfl7iXUgdQ0T
         CpvsQo1qvxlWzNNgWvgVYG4adcaWXsOa5weXejn7d7EzI4F1SpNkHEc1vhZC3sFRA9vt
         TI0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857298; x=1772462098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvOYLcElekz+hDX7Jna93XLYHDEzVU8smwFySHb8Bm8=;
        b=XhBXIkoWLmtcRY7pvW8EXMV0OtTmowWixN7GAvLJFEmMsbfgy0rOrNUahVurM1Nw5s
         B3l93fHPV7VhDOsNdJ1hG7jezm8EGa9aVo8AUdPZVnScM9r0BVMykllCFc/CFevD0YU7
         8yym/BWj5n1cnZwn6RFttKfAuqZKn9L6IDxPe2r8D6TbvQjawAjbTED96m5SESuj6l7L
         Pfc8Bga8wlTGfWqUBE7zujWoOAKGFmIM4xIvvhaRGTzKQEpStPWw9esxvP4A6DU5Gexj
         0xBjxxk1xkCDNos452sRfYDnNySyft9rM7h/J0ApIxQGHS78qchwIgaPbY9OuO4INCR4
         E+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857298; x=1772462098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvOYLcElekz+hDX7Jna93XLYHDEzVU8smwFySHb8Bm8=;
        b=UmH+kMxZ9qB6fgvPROSXHCRbEz/h0Q1yfVOfcfAWNr7840oZiFm2GHGW3jCJ80iJa/
         xZqQ8imv5uZg+D65FT5yKOB1b6dYI+BD/hOAToC/fJN0TgG13Iqu9DhVnDQJITievdfs
         M2drj5Js+GdFXhCXVzkc6BnSdAgr+SWh3iYjxUEbrr0eHp9tMCrT7HEL9w2U7y7GTg5M
         vd3lxP1rF50nb3HKT/AMj0C/sjuD1t4GUma+x2wMedGj4kq5T9DaxmkCUA2oBlCgoEu9
         HLBDYRMtGh00Q3AIoaMmPV8AwcjV/D8C1XYzlq+YXz8FZv23QsqAZ+cgZjUD7gcCxA3X
         Fo0A==
X-Forwarded-Encrypted: i=1; AJvYcCUHDTHRskHuwe+qE70OojG8f0zlEaS0upM/KN1Y6HIFEq3xiSGr6tYsQAL8ov8sLoNfK8oblmAB7pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjNnRJnCreQg4YXxQWQ5vhvxfY2KZpsYR0u92ssu2D3/aw7Tlm
	sblkzBrudrp2oZt/3G0/+PRT0mbPJUpkcu1kvWxsoYTuRwdAdq2/VDzHKOOlywjKjY9bvtVafhG
	5Qd2M+ZnuoLF12AcwgWlCe7UFGIqKIVfMpQ==
X-Gm-Gg: AZuq6aImxKRAv4H1i2K1Nlz1NK2vmAzQGbRuk40qOJ1q/niUcp83pIDk5JT5r7AnQvu
	Y4azyv+7zcMIWvLvcmbKPUmWUMp8tPnxSTO+tnCucIzwcILuEXUvpaNR0RCUTrIrG6W54DvBbmE
	nWFufYQ40WJxAfp138eGkfuQaO0FedLRrHzDDX2MqXEEjvUR2lqXGZRe/mstWkTJCDrizw5UEVU
	kN6sE4avmrQqK4GMNqIbHSEqh7vuT7r/pzsfBQaDh+VsiCCJgMd7PQoTOs4Bdvo4FEZOMGOzOZX
	aikC6s+pQhIemETafqciIhlERnk1NqAXX+Eq1VVaavMuQAAwYCmRxxXgGaZyB24diADf1oM=
X-Received: by 2002:a2e:b8cf:0:b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-389a5e6abebmr32022861fa.37.1771857297577; Mon, 23 Feb 2026
 06:34:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210022620.172570-1-festevam@gmail.com> <CAOMZO5BdgjaHKA6xV5MzPLDetqy-+iRdVPn3o38vo3szcxEhVg@mail.gmail.com>
 <32347982.43St1lv6Oq@diego>
In-Reply-To: <32347982.43St1lv6Oq@diego>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Feb 2026 11:34:46 -0300
X-Gm-Features: AaiRm53UEksx7wDyF9MxqaPxOEXz2-K9UDawkXeTmlpxSfNLW8bU5W22DHEjxsM
Message-ID: <CAOMZO5Af3XW+dwbAYFoRzYt904YPN32qgsatL2or4+XgxfV1yQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: rockchip: Add RV1103B CRU support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-clk@vger.kernel.org, jonas@kwiboo.se, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@nabladev.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Mon, Feb 23, 2026 at 11:21=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.d=
e> wrote:

> I generally pick up Rockchip clock changes anyway and then
> send PRs to the clock maintainers, so that'll work as always :-) .

Excellent! Thanks for letting me know.
