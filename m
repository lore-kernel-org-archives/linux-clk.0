Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B213B52E0
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866465; cv=pass; b=Y3qAZoIFVEQyWCeFHkOBfZvfvtbkuku8uAlk0H5v/yN18aHc57+UQx0Q/0Sz2wLBvcfLxz5Qv1/nDBdWSdO0mKoR8doPahpTOk6B7bVzmxmOtyurcqiBQzn1wFrTdcGtHot1nwXeOJH541qLQ6EGOhT1MBy+TGFW/sWPjh/Q51g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866465; c=relaxed/simple;
	bh=d9y55bKppxCwu8kQEd9JuS1z3KUYYcK2BoJdPrGox3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAB6CbkMbi7yyX2bkkJKAy2CJIgd+4asSVICpXJ5VlN3Prj4DOzlBsIuUGvTCniX1ZK7Nx9m00HQDvzgIr4qlHyROr+8f9ayOGaLOcNVwB9rSipcXYcOXdKrMAILwqtc9m8AXPbRIEXaDJ/pZAisRHFu1JiZncJFITDcOh3jUA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sak1P2kU; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sak1P2kU"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-124b07e5fe4so142956c88.3
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 03:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774866464; cv=none;
        d=google.com; s=arc-20240605;
        b=eamIsdO6ZXK1bWdNPtLTkuNRWS3/tZ+q14MevKKiEK6cqty9aOEvYm4mOD2fIOUalk
         UgWsU+GQnYUzKmpNIxYrxzNwgQOu4ROkRsj3a3fRbPUTiNrEK/1UGyA8pLDxyiEyQjr6
         F16KujrS81aFrw42ZKO4E0GmQMMWdSSbjzv8PhYn90S5DPOZ5MlLqf2o5Xfd3OM1hPk2
         ghzn+9DNE5dfGps/AA8FQ2VXYYLOS9w30InMJmvIk5IkYJ5F+4AdP5ZDtObNytusT0G6
         FnAksUnaxmN9Db77LqRec+lx+Ra3FdmjL1dejZMAReQawGBgxfLIGVNQSvJGIvUBRn40
         xIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9y55bKppxCwu8kQEd9JuS1z3KUYYcK2BoJdPrGox3E=;
        fh=XtPX7/PaWKMccKXiFezA+rHlDJO0cSXIOUsKe7XGD7E=;
        b=d2xSojyqiTHs2f1ocrM4bpwelaN9jbuWjyv2CFiztqeuVBp1AEHJRr8KFLJgO+tKKa
         we+Kxej8nI0GWA8980Ur920YpPKurW1Hx3ykUR/po+E7NZJK/14YyUWyfxlew+SjjEXF
         1TF3r4/eRlwzvqoWwS6t64SUxUNfjZMo4AHB1OBRBHF0KYwNjKExle0pKHO8VYHOK3v8
         zOW6/cPtfCKDFSjQn1fqPtOG4nOcf9n3cwFJlkfPteUshjkU1t2+fPBCM9b0fONO0ST1
         o2uSdRFd3YT+dvZC9GfRU0eUEwhsp8jRWz/vXhAAYTnt/IR/WZx32oO7Ri+vPT5vVl0n
         jNPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866464; x=1775471264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9y55bKppxCwu8kQEd9JuS1z3KUYYcK2BoJdPrGox3E=;
        b=Sak1P2kUGPLJ+21jHok2OEvJKwsqygZFcoRoNDqjwKyu2I5I+z9Nrx2jqFrXyx4J74
         Qxtwh5n8S61HpPbGorLzdfZzH776mp21LsQNRJUYE3PlhxjoJu1xfi/c5F7eEbTU0/0d
         oygWt6qGvliVrAe6U219gLY9yBHsLq9Z3EGnfae/MXyzvBjSG1F/5+oFg1PawnrxzzIo
         j5skVCFiPM8x9aM89S4tBUSU0rtR2s/35ShIQlxIb6mc8gEGrlHWoOopMpZzIV2VhsvQ
         yVWT6p0W8i2dTg0zjY1Xc6vV7qYFAfigtaIltCdBezOr9iadgWS97kEc4fcB3rscOTZV
         YjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866464; x=1775471264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9y55bKppxCwu8kQEd9JuS1z3KUYYcK2BoJdPrGox3E=;
        b=MqnbVfMjudujDty4zPpEmXt8TVsRv4odzVB45BM3AaShTfvcHVK3cmNHonTYXCq/RM
         FToPeRUiZcxUFsEfS4QNPxBlx/tnujlsI0TocodUaiqdnywaTbJOc+LDaGk0wCqpZvQy
         V+e2CZFctFsCPcAmXc6Hm4Wpyo/GsPznePI4o/2iUtsLUTONDJ/gCTNnwH74+hJdAHsb
         MuV+lgs5Y5yu090ICfhPPqGNgUi3sv/05VIsUZDZwmIQq8eYB1bsAGW2f30Exc/nKEsE
         Dh6YwknxYCl83qB0TnDwJHRom6c+K0o1tCopoziNgx8TVrh1LXHXLxyeplhRqnmTjrNX
         CNpw==
X-Forwarded-Encrypted: i=1; AJvYcCWaV82vg63TwUYDzaru5gwvx8ww66fOV82vuofKfqPyjITO5GU9AHs+CigwzupumikRy+M14WnVEVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvsvrWsO2MpHgw3Wjq7P/+SLwKwfM/itidX0kXrdLozBI/jZbT
	9CHyVEqZkH6faQJy17EbArraRJrAFhKp9fpIWtHInp+5T3SKNU2bSxZofmofEZxugXQQk/029De
	RcMX8iE3vowk0YoH5B8dHu2d/UDTFK+g=
X-Gm-Gg: ATEYQzyejpCnJZRL8QJNqvMKS+n+R/kPXrvmtffOAQEilrOwnSjI/QtA9ai3Ak2A1HE
	rXXgXC9Ln92ON+3OKlHklaBVz50hm2a/iegBlkVJ6aVNAsZ3DsT+MmPib839B9S29eMlBBbD7MZ
	iSsPsY8TVBOFG7mPqZOpTHx6hdSxCsyGc3rDlZqEiTv9wBTIJv0tOdQxHJMu+8+f3lcGY7gI46K
	54kwGEzrqLrPKcwsMz/d81zOWvThQzJGbFfACMWyXSwxYThNGAkP1KxZdUaGXK2/kYyaSFQlLga
	aLZy2Xf9Rij+caFUBTK7O/SK/dl/W9VTnzisWTAqUhGeEohXJ8Q/IdtCQvVKmgAHSGlSLnfjX8/
	LMy8TouGMlU15E/vMA5m2kV0=
X-Received: by 2002:a05:7300:f794:b0:2c5:704f:7157 with SMTP id
 5a478bee46e88-2c5704f7c1amr684174eec.2.1774866463645; Mon, 30 Mar 2026
 03:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com> <acoq7E8NH-ihCq1K@google.com>
In-Reply-To: <acoq7E8NH-ihCq1K@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Mar 2026 12:27:30 +0200
X-Gm-Features: AQROBzBw2zE5e8wBGjGUmjeI3w5sXAYU-mC5MJEbQZIxPhWtE3tBZZKIxgdi_Gk
Message-ID: <CANiq72=b6bFQ=OFEXMedO1JoL4qckRmTPYzFrXGCzgxZZOmbuA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Alice Ryhl <aliceryhl@google.com>
Cc: Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 9:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The drm-rust-next branch has closed now that -rc6 is out. If we don't
> hear from Stephen, do you mind picking it up Miguel?

Yeah, I will pick them -- I talked with Danilo about it a few days ago.

Cheers,
Miguel
