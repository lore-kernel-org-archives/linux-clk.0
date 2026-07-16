Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4374542D76E
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212125; cv=none; b=tWTB3wbFMaY5URAWGxYDck+C+U6vP7s/tABuWhmQcSd2EOROB0W3e8GsucMzslztBhsnmViSNerPE4+rqAGlglN6fvxeTtpFaZpkmtP79VCJGx04f30HOVJt4r7yC5qFtAUpVSl3nH3MIIFhsDy0Ixi1McNtu+8aG3eFDqrq6Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212125; c=relaxed/simple;
	bh=rlWJ5LlRFM7BIyY7SUUrQ362bmUhFLUP0vwKbJvlk5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJH2RCSF+RZLRVDBlIDd+TCl8UM/89sUXM1zWzfSulHtiYubNi+KXwo1F8Y7UtgxnKEaukzBpPzZnkoJf+MzON6QQOJ5Pa4l08AHCS0qvkHOveAEPYdMN3BT4keglISigredUT+7SCUlVlpakrZfm+9U6pgX7TRR/UeanbkH2nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W1IxijlV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rop5s4XF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W1IxijlV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rop5s4XF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784212123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrJkb28g5vCOjunGV7ewvnFrjPjFdF0Thp9Awt+P8b4=;
	b=W1IxijlVJ0XB69s1q4w0e9So4+dMOwDRnGbcY3gvBgkXQagjgnI5nd1RK65H8Rd5WH9iCo
	NruPBsNxSKj7hVo1NS+0y/BuzPI8oV6qn+VLFOYYvrZqeKhawU51TsCOuYLoZq5phrfbVu
	JaPXzKxw3NjW8GPaj0cqc3S4wE5Oenw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-oir-tJRPMIqKdUWFqvMP1Q-1; Thu, 16 Jul 2026 10:28:41 -0400
X-MC-Unique: oir-tJRPMIqKdUWFqvMP1Q-1
X-Mimecast-MFC-AGG-ID: oir-tJRPMIqKdUWFqvMP1Q_1784212121
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1852a86fso76005381cf.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784212121; x=1784816921; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WrJkb28g5vCOjunGV7ewvnFrjPjFdF0Thp9Awt+P8b4=;
        b=Rop5s4XFok2IBsLQ4HfSfTkSWUtF6N12uJoRZUPgZgXSp8UvGpm6D37VuKtDMNum1c
         PeKvFAw3RBGYwj8AZ9yDKUm4Ec9TmaKWId3AJ6WVY0Kw6SXU+4mOmtNKg3qt0pWGvOIg
         IWTkNzztbRL5Lgk6lSiryXQ8Am9srB1ARZ9z/qGOTruxLf0XusIJRV+nXB280JOgpAv5
         3bpdrAoc8uDnHckaX1cw8X2VUoyqDJTN/b97D1nT2soGTjcQ+KenDcvqA3sg6e1y6WTi
         +PES2Vkune9iovdOPQT3yTbq3P4pOyaFHSJpAvVUDGEswoHO2IBG00SxVs80n1rKmZh4
         DPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212121; x=1784816921;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrJkb28g5vCOjunGV7ewvnFrjPjFdF0Thp9Awt+P8b4=;
        b=KJHFQ1GP8yprpy4eqi8BCCUxvaWVNTggMxlUa7ByAtT2gJpnGs6unWPN8S4+CtK6rT
         4rafoVNDXllVYQ1X/rIvjvUgsIXAOBq7vN4rlS8z2FJvbOaf9r5QUxnVh7M/fPRcdDsR
         x+2kOFQUAnNwJSA2cqPeZJ/+DjMsFllR8NfHv7GNrJYNL2kfmuIzLWGheMwxBynZGLsn
         T3hPD6pgnHXn5snMM91Boz0Kyzsgu0W2erycnF9WFFUXfpo5tJjjKav+210o6PZMBQNm
         kt+/o4+YaBM2NV61drFqf1DCxxLX8qfLzLDLC4RP9WSdeFhY9X/0zSCUsPQ+13ZxoY05
         htlQ==
X-Forwarded-Encrypted: i=1; AHgh+RohcWTRCVyrhk7uKlRrrOhj7G2Am9OS3UhpKmgddQLStzm/uiRB+1yx7FYgdxa3WnSPY0/wUInw/bU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHA/V2yqaBKfI1D0Vz7twir8NJi8j+jmQCCHnTYRw3zA2FFRz4
	0vbmofyOccl2x+Sh28VQbKNlc6a+OIAMNqrQzEO+Y0cT5rYMkcudnGS/Tg4Qq9p6oMhbhfX/ruj
	0pJehMlJhB1eARVVSTP4+hAMhoGxne3vIfKR2dPWwKdt+BIzM6LLrJoqZkY9Pug==
X-Gm-Gg: AfdE7clrPExBZnBkB4sM+e4XjN3IEKwQN6hobCXDbWeVmscB20nzYZn36cO57Osxen8
	DI4JTPwKajeT6OwAIarbpqyZjnIvUb5MOkv6UF5APiXT+HpRJJTMoT43VdSdzhlYGNFhuuTaWth
	dlmjHDrkAX5vo7Fd39FIlp+yfWKAS5OZ/IBxyADjakgqqrn75LnNyASM5xwk2fvqF6uxrzCNlem
	mjRijmbWq7hSoJ4IGIlkaO4ak90iU/mVlPyQrePyGACn8x0h+2JgEMlmYIfQALa/ObQxfTs8xHM
	O5BwI/TyIPpJqQJugD329rctQvuwXxhFPc3oqQE/bXQWOBcvEeIa7edD8s6HssQD8KbQEfQ=
X-Received: by 2002:a05:622a:130e:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51e42352605mr118459621cf.9.1784212120958;
        Thu, 16 Jul 2026 07:28:40 -0700 (PDT)
X-Received: by 2002:a05:622a:130e:b0:51b:fb4f:afdf with SMTP id d75a77b69052e-51e42352605mr118459391cf.9.1784212120531;
        Thu, 16 Jul 2026 07:28:40 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6e326sm159020491cf.6.2026.07.16.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:28:39 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:28:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: duje@dujemihanovic.xyz, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mmp: pxa1908-apbcp: Remove unneeded semicolon
Message-ID: <aljql5MD-nvgqX4T@redhat.com>
References: <20260714053059.3219704-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714053059.3219704-1-nichen@iscas.ac.cn>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 14, 2026 at 01:30:59PM +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

