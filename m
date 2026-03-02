Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B31E1A33
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452000; cv=pass; b=mt82wmV3xGUX6GjL2aDdGzRKGKHsC9c7qW8PDCmtysRzHrff0+azPayOfKu9TgA4B05fFSKG+aINcCLWw5sLEceNXBmRQl4E86zQdQscXHzsPchD/MGtirEVsu++nARd7/eP0DOJOCDekgR6dfGB9+YXBmJ2Q6iXTtUhTgsn7TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452000; c=relaxed/simple;
	bh=YRoMm9tcpb1MSZ5gauwCMcDnS9cCaBTbIIMjFRWOu10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FT+D4mbOBGYUbqpdTGQSdNXIdcd6LWXD2w6OLqBN5mvVMODuXfnYrlnabJr0NS043ziwkxJ5yNxVvPcw/lNhsWOCw3wVxa4IqS5dUpbIpJYHcyO+GpFbjmifuy9MU89xbp4XQM7CkEUbHevfXfV3GGzMWCw0BF9j0+6fM0pmYr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DACsmumY; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DACsmumY"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-389f933034cso55569121fa.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 03:46:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772451997; cv=none;
        d=google.com; s=arc-20240605;
        b=OhZkzSGM5uO6cF+Fu9XVSNCpl52jpUeDojcQXF+qn7WOtwoknwLl1dT3ic4iMrlArD
         h6VkB5qnVq+h+mRm9ffynRj5BhN13xvK9+o8rgeasI9VAlbxnOb27LKK6VNdQytSq8Vq
         64tWveBzJPibVLeFvALqzBhFJ9ffMCFryb9F+MtqmjXM2Mh5GcQQ1FdxI/hi967N9Aux
         C40GJONCmNBxt35ayQh+jfJTM8Frd1ZLU606br4CAy312rT5SVRwLGRwGhYQEgRovJZP
         7iRbI0MspFawEln/y6EKuNj8Qw4YEmCrJd7d8igguhQxthNY1vUyRHhcdSmYzmPMuKJ8
         tIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRoMm9tcpb1MSZ5gauwCMcDnS9cCaBTbIIMjFRWOu10=;
        fh=7qJkPKGG3zMshE1VnQ7Hli1WIKv1DP/nWszaURAmkuE=;
        b=PXTenx7IRAKjrWEm1fkFX85MbUCNHsp8mSbNcW5VoDRPxQ9ZNClrtK5lZQhUzhB81D
         /2LpIPfN34De6hYR4GtCart8xr7xGgrW5Il1WiMkFa99st85BlcMNTnNdvS2m3QJMgpx
         WgnaBIytlz2+4+Zoubt7MlsKA9X6CwD2vnLsBuXZvMKyvRgqFOpwze8J2YD4LZsBsWA3
         TjvV+RoFox4LjBw0D8lhPH9hp9l4U4nL+FFIk4yU6/zaM6wk7aHqEjaXgu1Ny9fK2jvX
         YkpPg8Q9FknotZjZG6GlWKR7RMTqEiH/qNeSxZpfZtybKx95vcSqymcbqUoghCD4SJjh
         TIhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772451997; x=1773056797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRoMm9tcpb1MSZ5gauwCMcDnS9cCaBTbIIMjFRWOu10=;
        b=DACsmumYePet+xRPnhrD70l36K8cz+qUDTYZBEpCE3ADeiA7u80pFqEFkK8lAYzkdu
         h3sxnMet9lPS0ADMY8RvogOIvO6nY0Abl9EJwtuvsgysLIohrv0p0/uiqVu5tSBwEvb1
         FRAd9YEwbd6xMqEjD0E0tbLshbeSz+qqAmruCH+am6+3nStjTgeP25rIQvp0yH6gFDIn
         MA55VOcsjNVbVVX5hlVhWEFBAFn4B2Hyv5j+A29CbCF6BtlP5uNxDnqU91gPev1IrKTQ
         hxcxIjgByEAweaQVZrNVzUCboymrd5XhDB+laW91LvAWQONx7AJTyqeNfmBIwvhK1HYG
         XgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772451997; x=1773056797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRoMm9tcpb1MSZ5gauwCMcDnS9cCaBTbIIMjFRWOu10=;
        b=KcYaI0Z87Kd1ei4Xkhe847pImpafrCKUr0Nrn0REy/IR6zybM6flgEH2hhIGAEgr1O
         vUbbG8Lxxjh4fZVElvXO1TpuvM24EByozqYf41ciorhGhEvLRT/+O7uehxKcyfIAtv3e
         rERwCXt8edm2wZZBKePnWyMRlAkBvI3M8NFObOnUz57CMpp/ftUIj00bIQypVrK1+eob
         BHFNEMh7ZxqFxavy7eGP+ZET/Xt9GMnoUyhhgPD6r/BwmlEYXq289CdY0OHIGghLLO0e
         CrmcOvtXGSiMWVmutbxPbaYS7pO4NmG0J9CrGycTn6ysP1VIyevy08tS/EufcCSSojxq
         RScw==
X-Forwarded-Encrypted: i=1; AJvYcCWN7z3tcSnlxTwordXnHTP4Tp4Ngs4ChRSyrAw9TZK/tZmiC5dojAK2gZZtOcKoNm2L0RjRZDs1oWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLLHqdEiUAU+aI/pWnY8REiG9yutnxfY/Whslv4ed/591+rMqF
	B+y0nZOTgbT0UD9zV3Js9NDnJx8Csi246HAA3zq6eJWUctKzBulkIWWd8J5asmthZqvd3G07r+y
	hXAuj51wwoV89zatEKWgeS5iyHr0FfD0=
X-Gm-Gg: ATEYQzxhDjgG3K8Lc6uK6qilVBvnNOzmRvD9lad4Nxc2W9rUa8Efv1h64zhA5czNpWH
	3cweskQjYzntrv5RhyMlLTw1hYkFbvYpRrSKhVPj53lMi4mVD81FMVOMp/sMW0DQtGnsKBh7EWZ
	vOHD6GeXkJruXCOfIoR91Hgc6cI766a+5Ds9HIAT02Pg0K7g0sfnyXATRph64CmlvsM9fyL/byN
	Qwd3G24k7Lqi6TmpvS1MQ5KL0FlUaGB6zPelsjxa3TwUN2S1Fqo2gijHZe+WeypXVfUAnv5oPvg
	IZ6p+uIG94Ve20Cl+ni8t8AyXKHnnRQaWCSGzDAwmxdcDxBL3HYMlg/eiuLw8O3rgnJWWVA=
X-Received: by 2002:a05:651c:b21:b0:37b:8b7e:efd with SMTP id
 38308e7fff4ca-389ff365c0dmr73246811fa.39.1772451997062; Mon, 02 Mar 2026
 03:46:37 -0800 (PST)
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
Date: Mon, 2 Mar 2026 08:46:25 -0300
X-Gm-Features: AaiRm52Ngcb8bHgY9VS6WuN8uKXY8QulMVA8vk9T8aLZTq4kdlDYmVHrrjgwR2Q
Message-ID: <CAOMZO5AvymrELSnaHQ+cThcSDdPbayLPGwx-5YB18=0zm+oJ_w@mail.gmail.com>
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

Please let me know if you are OK with the RV1103B clock and dts series.

Thanks
