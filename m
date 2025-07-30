Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706DA42A82
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882774; cv=none; b=PkmVk1C3OjkC5ivksBGM25jkd4Jmlz0RfcG+ZdT1znLSt9engNRTIMB5/r5uQUACG5ijWArgJNBDEkXSQ81yWC6IoDFoPu39/Jcv3QJa56enShKBqi3n7W0cox0G2L2uwICC+GUCK9RZQVkLTWdzSD93iYvcMTiUB6kopH8e2+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882774; c=relaxed/simple;
	bh=8msNZxV4vzYZHV5zdjpoumhb4VdGCiYWL1hPZvJX9ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnREWXyh6T7z+9bAAjWGxUQCILHzNElSzdG2DdsEVVajvh8Ja+LAs9pdAM7RJN8+CCrN7Wc18WsDNTv+ocB9SYvjIrRxS+s3wp58+ogjDTUbzm3NRX3F8gs1X4zGNha01/99N3kSjwqg4eL8bkyx+yFDPVZ6L63/dq3V618CplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pFZmi5Gq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pFZmi5Gq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b783ea5014so2376651f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753882771; x=1754487571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItEELH3cRLVD+iAArrenHRjEW7ZVw4L4zIbc9jOQ2nI=;
        b=pFZmi5GqnR6GCsyM7o5Av0AxoSdCeD7pPeOmwSCVKPQplZBdXensaOdktyKZ1qdsa+
         9AFPFuxDmgPN4meywZDgABDdxhK9uP6cugI6sFD+cELkcoRoJW4m1JJE8ziFdQHYfBJP
         jwHbG1n5xbsTb++splsKifgnu1aBlavrAjoWI9QDlP49P7W1rYSDvHOjrBR78Ilsecap
         mfzAVOoGiX9L/a3iYTBA6gnYPJfXzSoW3lEgMa/410Pz6XhKhNw+YiXC+uImFs1ZdAZ3
         xeKgfuJhiAxowTu4nyIv9YBIuUrf+yB+ATSXWfcJjmQ76lUZf+N2MrOmKK+aHICjluyu
         xR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753882771; x=1754487571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItEELH3cRLVD+iAArrenHRjEW7ZVw4L4zIbc9jOQ2nI=;
        b=Uh0DqsEUBfkiLAdindZPiHICAlDSvuAiy3bplplKI2s3SXHQ9r/3EoWL8xdUN1+G/0
         aFTfDnXFJz1PmlFeU29hDOZmIHAYKvwOVBXdl9ZMHbH8/lxNNpdz85pKxxi/9B5oG57d
         9TbnsztVARXbz3sOj03sOA79iDKw8e9jGnf9+//UU8EUXRLe77BJGZcp9wM5eE8hTOXS
         OAWBaGYIk3junNuwrupDR7bj3Ll8d91xL+k5Fm4uhaB4NCIZSzz6Ll6uOUCqmiEYCKIb
         eKxBMacxI3ykrcoWiYR5KTjflULjZgqDu2OFNmzunZkxz2mC3T4IXdjo+CFLS0FU77e9
         yJhw==
X-Forwarded-Encrypted: i=1; AJvYcCV9pOfi0I1nIi2QvffsPy1y65C6hnFsG3Ze8rnWd9pEi+Fx8verFIEPvqH0gjLYvbrjxA8sqnzwQlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJG3R4Z9gNrr9u5Hue0SmVCJhhdmuN/WJnDW9p17EELWvtCWWM
	DpLImZmxduKhQ5INv64RBTzsBCMBfttGyTE2oLj6TqjoGEvs255h0XTJP9QVb/CkP4xyQUHWbNT
	v1d9RDPxVqeLc7zp3ose7O2JYJYmc9Zcy5/JZKokG
X-Gm-Gg: ASbGncucEworigoLCi3G0mQnJZPFkU6n/kXRkbG3iweHMKn+4MkJCg56qr850xmGFze
	UNyOyD3mCmfaVGKs5eC9sqhH46ZOBbBFESruh7L/V8JaQ97jvwN1wmPUlqaZQUVWbf8mIuQIltn
	sg15GTc3tPOYhLLAm+M0cyNk7bf2KAyPvo2IqQ7kzTVeldKMC4vaAofUra2rT8/pVTam9P1ZbRM
	A5uh9c+
X-Google-Smtp-Source: AGHT+IEyr2t9aHif2RFUX92J/+mKbiL5ER5m1V7hwBgTcdhRVH7lV6emYSvc7TOE1oUP0faIrNPGeGeGOw3MAShGOAw=
X-Received: by 2002:a05:6000:288c:b0:3a4:eae1:a79f with SMTP id
 ffacd0b85a97d-3b794ffd043mr2795662f8f.33.1753882770587; Wed, 30 Jul 2025
 06:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729-clk-type-state-v1-1-896b53816f7b@collabora.com>
 <fc26c393-5c4b-48a8-a7ac-12558f79b140@sedlak.dev> <DBP8RFDV59PF.1OV46P0UYKOGM@kernel.org>
 <07575756-58EA-4245-B837-AEC4DDCD0DB5@collabora.com> <20cc8581-0af2-47b3-9fdd-584ff0ef36ab@sedlak.dev>
In-Reply-To: <20cc8581-0af2-47b3-9fdd-584ff0ef36ab@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Jul 2025 15:39:18 +0200
X-Gm-Features: Ac12FXzumko90MY33tXnHyIvT1ML5t_t7BouF-ETji09Sr887Pkg4SW4INEXrAY
Message-ID: <CAH5fLgjBQF+AGWQ-rKowViiL1kK47FZ80QfEa58Cx9bk11cjAw@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: use the type-state pattern
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 3:27=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
>
> On 7/30/25 2:59 PM, Daniel Almeida wrote:
> > [=E2=80=A6]
> >
> >> We essentially would like to have a `#[sealed]` attribute that we can
> >> put on a trait to avoid the `mod private { pub trait Sealed }` dance.
> >> (so a trait that cannot be implemented outside of the module declaring
> >> it)
> >>
> >> ---
> >> Cheers,
> >> Benno
> >
> > This is not exactly what you said, but how about a declarative macro? e=
.g.:
> >
> > macro_rules! sealed {
> >      ($($ty:ident),* $(,)?) =3D> {
> >          mod private {
> >              pub trait Sealed {}
> >              $(impl Sealed for super::$ty {})*
> >          }
> >          use private::Sealed;
> >      };
> > }
> >
> > sealed!(Unprepared, Prepared, Enabled)
> >
> > Note that I am just brainstorming the general idea here, I did not test=
 it yet.
>
> I think that API-wise it would be better to have a proc-macro #[sealed],
> something similar to [1], as it may provide better error messages, when
> used incorrectly. So the outcome could look like.
>
>         #[sealed]
>         pub trait ClkState {
>         =E2=80=A6
>         }
>
> And then
>
>         #[sealed]
>         impl ClkState for XXX {
>         =E2=80=A6
>         }
>
> If you are interested, I can try to look into that.
>
> Link: https://crates.io/crates/sealed [1]

It seems a bit much to have macros for everything.
